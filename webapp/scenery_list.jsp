<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.wenzhou.model.Scenery" %>
            <%@ page import="com.wenzhou.model.User" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Wenzhou Scenery - WenzhouTravel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <style>
                        .scenery-card img {
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
                                    <li class="nav-item"><a class="nav-link active" href="scenery">Scenery</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">Culture</a></li>
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
                        <h1 class="mb-4 text-center">Wenzhou Landscapes</h1>

                        <!-- Search Bar -->
                        <div class="row justify-content-center mb-5">
                            <div class="col-md-6">
                                <form action="scenery" method="get" class="d-flex">
                                    <input type="hidden" name="action" value="list">
                                    <input class="form-control me-2" type="search" placeholder="Search scenery..."
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
                                    data-bs-target="#addSceneryModal">Add New Scenery</button>
                            </div>
                            <% } %>

                                <!-- Scenery Grid -->
                                <div class="row row-cols-1 row-cols-md-3 g-4">
                                    <% List<Scenery> list = (List<Scenery>) request.getAttribute("sceneries");
                                            if (list != null && !list.isEmpty()) {
                                            for (Scenery s : list) {
                                            %>
                                            <div class="col">
                                                <div class="card h-100 scenery-card">
                                                    <img src="images/<%=s.getImgUrl()%>" class="card-img-top"
                                                        alt="<%=s.getSceneName()%>"
                                                        onerror="this.src='https://via.placeholder.com/300x200?text=No+Image'">
                                                    <div class="card-body">
                                                        <h5 class="card-title">
                                                            <%=s.getSceneName()%>
                                                        </h5>
                                                        <p class="card-text"><span class="badge bg-info">
                                                                <%=s.getLevel()%>
                                                            </span></p>
                                                        <p class="card-text fw-bold text-primary">¥
                                                            <%=s.getTicketPrice()%>
                                                        </p>
                                                        <p class="card-text text-muted small">
                                                            <%=s.getLocation()%>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <a href="scenery?action=detail&id=<%=s.getId()%>"
                                                            class="btn btn-outline-primary w-100">View Details</a>
                                                        <% if (user !=null && user.getIsAdmin()==1) { %>
                                                            <a href="scenery?action=delete&id=<%=s.getId()%>"
                                                                class="btn btn-sm btn-danger mt-2 w-100"
                                                                onclick="return confirm('Are you sure?')">Delete</a>
                                                            <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } } else { %>
                                                <div class="col-12 text-center">
                                                    <p>No scenery items found.</p>
                                                </div>
                                                <% } %>
                                </div>
                    </div>

                    <!-- Add Modal -->
                    <% if (user !=null && user.getIsAdmin()==1) { %>
                        <div class="modal fade" id="addSceneryModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="scenery" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Add New Scenery</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Name</label>
                                                <input type="text" class="form-control" name="sceneName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Level (e.g. 5A)</label>
                                                <input type="text" class="form-control" name="level">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Ticket Price</label>
                                                <input type="number" step="0.01" class="form-control" name="ticketPrice"
                                                    required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Location</label>
                                                <input type="text" class="form-control" name="location">
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