<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cloud Tour Wenzhou</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            .hero-section {
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/banner.jpg');
                background-size: cover;
                background-position: center;
                height: 60vh;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
            }
        </style>
    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">WenzhouTravel</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Food</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Scenery</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Culture</a></li>
                        <% if (session.getAttribute("user")==null) { %>
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login/Register</a></li>
                            <% } else { com.wenzhou.model.User user=(com.wenzhou.model.User)
                                session.getAttribute("user"); %>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        Welcome, <%=user.getUsername()%>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Profile</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                                    </ul>
                                </li>
                                <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <header class="hero-section">
            <div class="container">
                <h1 class="display-3 fw-bold">Welcome to Wenzhou</h1>
                <p class="lead">Discover the beauty of landscape, food, and culture.</p>
                <a href="#" class="btn btn-primary btn-lg mt-3">Start Exploring</a>
            </div>
        </header>

        <!-- Main Content Container -->
        <div class="container my-5">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Delicious Food</h5>
                            <p class="card-text">Explore the unique flavors of Wenzhou cuisine.</p>
                            <a href="#" class="btn btn-outline-primary">View More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Beautiful Scenery</h5>
                            <p class="card-text">From Yandang Mountains to Nanxi River.</p>
                            <a href="#" class="btn btn-outline-primary">View More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Rich Culture</h5>
                            <p class="card-text">Immerse yourself in history and tradition.</p>
                            <a href="#" class="btn btn-outline-primary">View More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-light py-4 mt-auto">
            <div class="container text-center text-muted">
                <p>&copy; 2025 WenzhouTravel. All rights reserved.</p>
            </div>
        </footer>

        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>