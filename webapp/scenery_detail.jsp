<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.wenzhou.model.Scenery" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Scenery Detail - WenzhouTravel</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">WenzhouTravel</a>
                </div>
            </nav>

            <div class="container my-5">
                <% Scenery s=(Scenery) request.getAttribute("scenery"); if (s !=null) { %>
                    <div class="row">
                        <div class="col-md-6">
                            <img src="images/<%=s.getImgUrl()%>" class="img-fluid rounded shadow"
                                alt="<%=s.getSceneName()%>"
                                onerror="this.src='https://via.placeholder.com/600x400?text=No+Image'">
                        </div>
                        <div class="col-md-6">
                            <h2 class="display-4">
                                <%=s.getSceneName()%> <span class="badge bg-info fs-5 align-middle">
                                        <%=s.getLevel()%>
                                    </span>
                            </h2>
                            <h4 class="text-muted mb-3"><i class="bi bi-geo-alt"></i>
                                <%=s.getLocation()%>
                            </h4>
                            <h3 class="text-primary fw-bold mb-4">Ticket: ¥<%=s.getTicketPrice()%>
                            </h3>
                            <p class="lead">
                                <%=s.getDescription()%>
                            </p>

                            <a href="scenery" class="btn btn-secondary mt-3">Back to List</a>
                        </div>
                    </div>
                    <% } else { %>
                        <div class="alert alert-warning">Scenery not found.</div>
                        <a href="scenery" class="btn btn-secondary">Back to List</a>
                        <% } %>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>