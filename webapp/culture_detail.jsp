<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.wenzhou.model.Culture" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Culture Detail - WenzhouTravel</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">WenzhouTravel</a>
                </div>
            </nav>

            <div class="container my-5">
                <% Culture c=(Culture) request.getAttribute("culture"); if (c !=null) { %>
                    <div class="row">
                        <div class="col-md-6">
                            <img src="images/<%=c.getImgUrl()%>" class="img-fluid rounded shadow"
                                alt="<%=c.getCultureName()%>"
                                onerror="this.src='https://via.placeholder.com/600x400?text=No+Image'">
                        </div>
                        <div class="col-md-6">
                            <h2 class="display-4">
                                <%=c.getCultureName()%>
                            </h2>
                            <h4 class="text-muted"><span class="badge bg-secondary">
                                    <%=c.getType()%>
                                </span></h4>
                            <p class="text-muted fs-5">History: <%=c.getHistory()%>
                            </p>

                            <h5 class="mt-4">Significance</h5>
                            <p>
                                <%=c.getSignificance()%>
                            </p>

                            <h5 class="mt-3">Description</h5>
                            <p class="lead">
                                <%=c.getDescription()%>
                            </p>

                            <a href="culture" class="btn btn-secondary mt-3">Back to List</a>
                        </div>
                    </div>
                    <% } else { %>
                        <div class="alert alert-warning">Culture item not found.</div>
                        <a href="culture" class="btn btn-secondary">Back to List</a>
                        <% } %>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>