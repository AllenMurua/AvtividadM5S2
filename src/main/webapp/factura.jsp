<%--
  Created by IntelliJ IDEA.
  User: mroso
  Date: 10/24/2024
  Time: 1:15 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Factura</title>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
</head>
<body>
<div class='container mt-5'>
    <div class='alert alert-success' role='alert'>
        <h4 class='alert-heading'>¡Factura generada con éxito!</h4>
        <p>Nombre: ${nombre}</p>
        <p>Dirección: ${direccion}</p>
        <p>Total: $${total_general}</p>
    </div>
    <a href='/hello-servlet' class='btn btn-primary'>Volver</a>
</div>
</body>
</html>