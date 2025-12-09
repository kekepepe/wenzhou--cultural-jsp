<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.wenzhou.model.Food" %>
            <%@ page import="com.wenzhou.model.User" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Wenzhou Food - WenzhouTravel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <style>
                        .food-card img {
                            height: 200px;
                            object-fit: cover;
                        }
                    </style>
                </head>

                <body>

                    <!-- Navigation (Same as index) -->
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
                                    <li class="nav-item"><a class="nav-link active" href="food">Food</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">Scenery</a></li>
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
                        <h1 class="mb-4 text-center">Wenzhou Delicacies</h1>

                        <!-- Search Bar -->
                        <div class="row justify-content-center mb-5">
                            <div class="col-md-6">
                                <form action="food" method="get" class="d-flex">
                                    <input type="hidden" name="action" value="list">
                                    <input class="form-control me-2" type="search" placeholder="Search food..."
                                        aria-label="Search" name="keyword" value="<%=request.getParameter("
                                        keyword")==null ? "" : request.getParameter("keyword")%>">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>
                        </div>

                        <!-- Admin Actions -->
                        <% if (user !=null && user.getIsAdmin()==1) { %>
                            <div class="mb-3 text-end">
                                <!-- Assume a modal or separate page for Adding, for now just a button placeholder or handled elsewhere -->
                                <!-- For simplicity in this template, I won't fully implement the ADD form UI unless requested, but the servlet supports it -->
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#addFoodModal">Add New Food</button>
                            </div>
                            <% } %>

                                <!-- Food Grid -->
                                <div class="row row-cols-1 row-cols-md-3 g-4">
                                    <% List<Food> foods = (List<Food>) request.getAttribute("foods");
                                            if (foods != null && !foods.isEmpty()) {
                                            for (Food f : foods) {
                                            %>
                                            <div class="col">
                                                <div class="card h-100 food-card">
                                                    <!-- Using placeholder image connection -->
                                                    <img src="images/<%=f.getImgUrl()%>" class="card-img-top"
                                                        alt="<%=f.getFoodName()%>"
                                                        onerror="this.src='https://via.placeholder.com/300x200?text=No+Image'">
                                                    <div class="card-body">
                                                        <h5 class="card-title">
                                                            <%=f.getFoodName()%>
                                                        </h5>
                                                        <p class="card-text text-muted">
                                                            <%=f.getTaste()%>
                                                        </p>
                                                        <p class="card-text fw-bold text-primary">¥<%=f.getPrice()%>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <a href="food?action=detail&id=<%=f.getId()%>"
                                                            class="btn btn-outline-primary w-100">View Details</a>
                                                        <% if (user !=null && user.getIsAdmin()==1) { %>
                                                            <a href="food?action=delete&id=<%=f.getId()%>"
                                                                class="btn btn-sm btn-danger mt-2 w-100"
                                                                onclick="return confirm('Are you sure?')">Delete</a>
                                                            <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } } else { %>
                                                <div class="col-12 text-center">
                                                    <p>No food items found.</p>
                                                </div>
                                                <% } %>
                                </div>
                    </div>

                    <!-- Add Food Modal (Admin Only) -->
                    <% if (user !=null && user.getIsAdmin()==1) { %>
                        <div class="modal fade" id="addFoodModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="food" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Add New Food</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Name</label>
                                                <input type="text" class="form-control" name="foodName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Taste</label>
                                                <input type="text" class="form-control" name="taste">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Price</label>
                                                <input type="number" step="0.01" class="form-control" name="price"
                                                    required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Description</label>
                                                <textarea class="form-control" name="description"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Image Filename</label>
                                                <input type="text" class="form-control" name="imgUrl"
                                                    placeholder="e.g. rice.jpg">
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