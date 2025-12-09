<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.wenzhou.model.User" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Admin Dashboard - WenzhouTravel</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>

            <% User user=(User) session.getAttribute("user"); if (user==null || user.getIsAdmin() !=1) {
                response.sendRedirect("login.jsp"); return; } %>

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container">
                        <a class="navbar-brand" href="index.jsp">WenzhouTravel Admin</a>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item"><a class="nav-link" href="index.jsp">Back to Site</a></li>
                                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container my-5">
                    <h1 class="mb-5 text-center">Management Dashboard</h1>

                    <div class="row g-4">
                        <div class="col-md-4">
                            <div class="card text-center h-100 border-primary">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Manage Food</h5>
                                    <p class="card-text">Add, Update, or Delete Wenzhou Delicacies.</p>
                                    <a href="food?action=list" class="btn btn-primary">Go to Food Management</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center h-100 border-success">
                                <div class="card-body">
                                    <h5 class="card-title text-success">Manage Scenery</h5>
                                    <p class="card-text">Update tourist spots and landscapes.</p>
                                    <a href="scenery?action=list" class="btn btn-success">Go to Scenery Management</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center h-100 border-info">
                                <div class="card-body">
                                    <h5 class="card-title text-info">Manage Culture</h5>
                                    <p class="card-text">Edit cultural heritage entries.</p>
                                    <a href="culture?action=list" class="btn btn-info text-white">Go to Culture
                                        Management</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    Admin Information
                                </div>
                                <div class="card-body">
                                    <p><strong>Admin Name:</strong>
                                        <%=user.getRealname()%>
                                    </p>
                                    <p><strong>Email:</strong>
                                        <%=user.getEmail()%>
                                    </p>
                                    <p class="text-muted small">You have full access to modify content. Please allow
                                        user sessions to persist securely.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>