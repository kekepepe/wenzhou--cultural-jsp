<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.wenzhou.model.Culture" %>
            <%@ page import="com.wenzhou.model.User" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Wenzhou Culture - WenzhouTravel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <style>
                        .culture-card img {
                            height: 200px;
                            object-fit: cover;
                        }
                    </style>
                </head>

                <body>

                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <div class="container">
                            <a class="navbar-brand" href="index.jsp">WenzhouTravel</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarNav">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNav">
                                <ul class="navbar-nav ms-auto">
                                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                                    <li class="nav-item"><a class="nav-link" href="food">Food</a></li>
                                    <li class="nav-item"><a class="nav-link" href="scenery">Scenery</a></li>
                                    <li class="nav-item"><a class="nav-link active" href="culture">Culture</a></li>
                                    <% User user=(User) session.getAttribute("user"); if (user==null) { %>
                                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login/Register</a>
                                        </li>
                                        <% } else { %>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Welcome, <%=user.getUsername()%>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                                                </ul>
                                            </li>
                                            <% } %>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    <div class="container my-5">
                        <h1 class="mb-4 text-center">Wenzhou Culture & Heritage</h1>

                        <!-- Search Bar -->
                        <div class="row justify-content-center mb-5">
                            <div class="col-md-6">
                                <form action="culture" method="get" class="d-flex">
                                    <input type="hidden" name="action" value="list">
                                    <input class="form-control me-2" type="search" placeholder="Search culture..."
                                        aria-label="Search" name="keyword" value="<%=request.getParameter("
                                        keyword")==null ? "" : request.getParameter("keyword")%>">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>
                        </div>

                        <!-- Admin Actions -->
                        <% if (user !=null && user.getIsAdmin()==1) { %>
                            <div class="mb-3 text-end">
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#addCultureModal">Add New Culture Items</button>
                            </div>
                            <% } %>

                                <!-- Culture Grid -->
                                <div class="row row-cols-1 row-cols-md-3 g-4">
                                    <% List<Culture> list = (List<Culture>) request.getAttribute("cultures");
                                            if (list != null && !list.isEmpty()) {
                                            for (Culture c : list) {
                                            %>
                                            <div class="col">
                                                <div class="card h-100 culture-card">
                                                    <img src="images/<%=c.getImgUrl()%>" class="card-img-top"
                                                        alt="<%=c.getCultureName()%>"
                                                        onerror="this.src='https://via.placeholder.com/300x200?text=No+Image'">
                                                    <div class="card-body">
                                                        <h5 class="card-title">
                                                            <%=c.getCultureName()%>
                                                        </h5>
                                                        <p class="card-text"><span class="badge bg-warning text-dark">
                                                                <%=c.getType()%>
                                                            </span></p>
                                                        <p class="card-text text-muted small">Since: <%=c.getHistory()%>
                                                        </p>
                                                        <p class="card-text text-truncate">
                                                            <%=c.getSignificance()%>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <a href="culture?action=detail&id=<%=c.getId()%>"
                                                            class="btn btn-outline-primary w-100">View Details</a>
                                                        <% if (user !=null && user.getIsAdmin()==1) { %>
                                                            <a href="culture?action=delete&id=<%=c.getId()%>"
                                                                class="btn btn-sm btn-danger mt-2 w-100"
                                                                onclick="return confirm('Are you sure?')">Delete</a>
                                                            <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } } else { %>
                                                <div class="col-12 text-center">
                                                    <p>No culture items found.</p>
                                                </div>
                                                <% } %>
                                </div>
                    </div>

                    <!-- Add Modal -->
                    <% if (user !=null && user.getIsAdmin()==1) { %>
                        <div class="modal fade" id="addCultureModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="culture" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Add New Culture Item</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Name</label>
                                                <input type="text" class="form-control" name="cultureName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Type (e.g. Intangible Heritage)</label>
                                                <input type="text" class="form-control" name="type">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">History (e.g. Qing Dynasty)</label>
                                                <input type="text" class="form-control" name="history">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Significance</label>
                                                <textarea class="form-control" name="significance"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" name="description"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Image Filename</label>
                                                <input type="text" class="form-control" name="imgUrl">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% } %>

                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>