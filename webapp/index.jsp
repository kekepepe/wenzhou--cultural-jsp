<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.wenzhou.model.User" %>
        <%@ page import="com.wenzhou.dao.FoodDao" %>
            <%@ page import="com.wenzhou.dao.SceneryDao" %>
                <%@ page import="com.wenzhou.dao.CultureDao" %>
                    <%@ page import="com.wenzhou.model.Food" %>
                        <%@ page import="com.wenzhou.model.Scenery" %>
                            <%@ page import="com.wenzhou.model.Culture" %>
                                <%@ page import="java.util.List" %>
                                    <!DOCTYPE html>
                                    <html lang="en">

                                    <head>
                                        <meta charset="UTF-8">
                                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                        <title>Cloud Tour Wenzhou</title>
                                        <!-- Bootstrap 5 CSS -->
                                        <link
                                            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                                            rel="stylesheet">
                                        <!-- Custom CSS -->
                                        <style>
                                            .hero-section {
                                                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('images/banner.jpg');
                                                background-size: cover;
                                                background-position: center;
                                                height: 60vh;
                                                color: white;
                                                display: flex;
                                                align-items: center;
                                                justify-content: center;
                                                text-align: center;
                                            }

                                            .section-title {
                                                border-bottom: 2px solid #0d6efd;
                                                display: inline-block;
                                                padding-bottom: 10px;
                                                margin-bottom: 30px;
                                            }

                                            .showcase-img {
                                                height: 200px;
                                                object-fit: cover;
                                            }
                                        </style>
                                    </head>

                                    <body class="d-flex flex-column min-vh-100">

                                        <!-- Navigation -->
                                        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                                            <div class="container">
                                                <a class="navbar-brand" href="index.jsp">Cloud Tour Wenzhou</a>
                                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#navbarNav">
                                                    <span class="navbar-toggler-icon"></span>
                                                </button>
                                                <div class="collapse navbar-collapse" id="navbarNav">
                                                    <ul class="navbar-nav ms-auto">
                                                        <li class="nav-item"><a class="nav-link active"
                                                                href="index.jsp">Home</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="food">Food</a>
                                                        </li>
                                                        <li class="nav-item"><a class="nav-link"
                                                                href="scenery">Scenery</a></li>
                                                        <li class="nav-item"><a class="nav-link"
                                                                href="culture">Culture</a></li>
                                                        <% User user=(User) session.getAttribute("user"); if
                                                            (user==null) { %>
                                                            <li class="nav-item"><a class="nav-link"
                                                                    href="login.jsp">Login/Register</a></li>
                                                            <% } else { if (user.getIsAdmin()==1) { %>
                                                                <li class="nav-item"><a class="nav-link text-warning"
                                                                        href="admin.jsp">Admin</a></li>
                                                                <% } %>
                                                                    <li class="nav-item dropdown">
                                                                        <a class="nav-link dropdown-toggle" href="#"
                                                                            id="navbarDropdown" role="button"
                                                                            data-bs-toggle="dropdown"
                                                                            aria-expanded="false">
                                                                            Welcome, <%=user.getUsername()%>
                                                                        </a>
                                                                        <ul class="dropdown-menu"
                                                                            aria-labelledby="navbarDropdown">
                                                                            <li><a class="dropdown-item"
                                                                                    href="logout">Logout</a></li>
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
                                                <a href="scenery" class="btn btn-primary btn-lg mt-3">Start
                                                    Exploring</a>
                                            </div>
                                        </header>

                                        <!-- Main Content Container -->
                                        <div class="container my-5">

                                            <!-- Food Showcase -->
                                            <div class="mb-5">
                                                <h2 class="text-center"><span class="section-title">Featured Food</span>
                                                </h2>
                                                <div class="row g-4">
                                                    <% FoodDao foodDao=new FoodDao(); List<Food> foods =
                                                        foodDao.findAll(); // Simple fetch all for now, limit in UI
                                                        logic
                                                        int limitF = 0;
                                                        for(Food f : foods) {
                                                        if(limitF++ >= 3) break;
                                                        %>
                                                        <div class="col-md-4">
                                                            <div class="card h-100 shadow-sm">
                                                                <img src="images/<%=f.getImgUrl()%>"
                                                                    class="card-img-top showcase-img"
                                                                    alt="<%=f.getFoodName()%>"
                                                                    onerror="this.src='https://via.placeholder.com/300x200?text=Food'">
                                                                <div class="card-body">
                                                                    <h5 class="card-title">
                                                                        <%=f.getFoodName()%>
                                                                    </h5>
                                                                    <p class="card-text text-truncate">
                                                                        <%=f.getDescription()%>
                                                                    </p>
                                                                    <a href="food?action=detail&id=<%=f.getId()%>"
                                                                        class="btn btn-outline-primary btn-sm">Read
                                                                        More</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <% } %>
                                                </div>
                                                <div class="text-center mt-3">
                                                    <a href="food" class="btn btn-link">View All Food &rarr;</a>
                                                </div>
                                            </div>

                                            <!-- Scenery Showcase -->
                                            <div class="mb-5">
                                                <h2 class="text-center"><span class="section-title">Scenic Spots</span>
                                                </h2>
                                                <div class="row g-4">
                                                    <% SceneryDao sceneryDao=new SceneryDao(); List<Scenery> sceneries =
                                                        sceneryDao.findAll();
                                                        int limitS = 0;
                                                        for(Scenery s : sceneries) {
                                                        if(limitS++ >= 3) break;
                                                        %>
                                                        <div class="col-md-4">
                                                            <div class="card h-100 shadow-sm">
                                                                <img src="images/<%=s.getImgUrl()%>"
                                                                    class="card-img-top showcase-img"
                                                                    alt="<%=s.getSceneName()%>"
                                                                    onerror="this.src='https://via.placeholder.com/300x200?text=Scenery'">
                                                                <div class="card-body">
                                                                    <h5 class="card-title">
                                                                        <%=s.getSceneName()%>
                                                                    </h5>
                                                                    <p class="card-text text-truncate">
                                                                        <%=s.getDescription()%>
                                                                    </p>
                                                                    <a href="scenery?action=detail&id=<%=s.getId()%>"
                                                                        class="btn btn-outline-success btn-sm">Explore</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <% } %>
                                                </div>
                                                <div class="text-center mt-3">
                                                    <a href="scenery" class="btn btn-link text-success">View All Scenery
                                                        &rarr;</a>
                                                </div>
                                            </div>

                                            <!-- Culture Showcase -->
                                            <div class="mb-5">
                                                <h2 class="text-center"><span class="section-title">Cultural
                                                        Heritage</span></h2>
                                                <div class="row g-4">
                                                    <% CultureDao cultureDao=new CultureDao(); List<Culture> cultures =
                                                        cultureDao.findAll();
                                                        int limitC = 0;
                                                        for(Culture c : cultures) {
                                                        if(limitC++ >= 3) break;
                                                        %>
                                                        <div class="col-md-4">
                                                            <div class="card h-100 shadow-sm">
                                                                <img src="images/<%=c.getImgUrl()%>"
                                                                    class="card-img-top showcase-img"
                                                                    alt="<%=c.getCultureName()%>"
                                                                    onerror="this.src='https://via.placeholder.com/300x200?text=Culture'">
                                                                <div class="card-body">
                                                                    <h5 class="card-title">
                                                                        <%=c.getCultureName()%>
                                                                    </h5>
                                                                    <p class="card-text text-truncate">
                                                                        <%=c.getDescription()%>
                                                                    </p>
                                                                    <a href="culture?action=detail&id=<%=c.getId()%>"
                                                                        class="btn btn-outline-info btn-sm">Learn
                                                                        More</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <% } %>
                                                </div>
                                                <div class="text-center mt-3">
                                                    <a href="culture" class="btn btn-link text-info">View All Culture
                                                        &rarr;</a>
                                                </div>
                                            </div>

                                        </div>

                                        <!-- Footer -->
                                        <footer class="bg-dark text-white py-4 mt-auto">
                                            <div class="container text-center">
                                                <div class="row">
                                                    <div class="col-md-6 text-md-start">
                                                        <h5>Cloud Tour Wenzhou</h5>
                                                        <p class="small">Experience the charm of Wenzhou online.</p>
                                                    </div>
                                                    <div class="col-md-6 text-md-end">
                                                        <p>&copy; 2025 WenzhouTravel. All rights reserved.</p>
                                                        <p class="small mb-0">Student ID: [Your ID] | Name: [Your Name]
                                                        </p>
                                                        <p class="small">Phone: 138-0000-0000</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </footer>

                                        <!-- Bootstrap 5 JS -->
                                        <script
                                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                                    </body>

                                    </html>