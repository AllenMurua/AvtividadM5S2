<%@ page import="com.example.actividadm5s2.objects.Producto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.actividadm5s2.servicio.ProductoServicio" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .logo {
            max-width: 200px;
            height: auto;
        }
        .header-text {
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Header -->
    <div class="row mb-4">
        <div class="col-md-6">
            <div class="d-flex align-items-center">
                <div class="bg-primary p-3 rounded">
                    <h2 class="text-white m-0">E-Camp</h2>
                    <small class="text-white">Powered by Edutecno</small>
                </div>
            </div>
        </div>
        <div class="col-md-6 text-end">
            <h4>Generador Factura 2021</h4>
            <p class="header-text">Competition Part Ltda.<br/>Año 2021 exento</p>
        </div>
    </div>

    <!-- Formulario -->
    <form id="facturaform" action="/hello-servlet" method="post">
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label class="form-label">Nombre Completo</label>
                        <input name="nombre" type="text" class="form-control" placeholder="Su nombre..." required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Dirección</label>
                        <input name="direccion" type="text" class="form-control" placeholder="Su dirección..." required>
                    </div>
                </div>

                <!-- Tabla de Productos -->
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>Producto</th>
                            <th>Descripción</th>
                            <th>Valor unidad</th>
                            <th>Cantidad</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody id="tablaDatos">
                        <%
                            ProductoServicio ps = new ProductoServicio();
                            ArrayList<Producto> productos = ps.getProductos();
                            if (productos != null) {
                                for (int i = 0; i < productos.size(); i++) {
                                    Producto producto = productos.get(i);
                        %>
                        <tr>
                            <td><%= producto.getNombre() %></td>
                            <td><%= producto.getDescripcion() %></td>
                            <td class="precio-valor">$<%= producto.getPrecio() %></td>
                            <td>
                                <input type="number" name="cantidad_<%= i %>" class="form-control form-control-sm cantidad-input"
                                       min="0" value="0" onchange="calcularFila(this)">
                                <input type="hidden" name="producto_nombre_<%= i %>" value="<%= producto.getNombre() %>">
                                <input type="hidden" name="producto_precio_<%= i %>" value="<%= producto.getPrecio() %>">
                            </td>
                            <td class="total-fila">$0</td>
                        </tr>
                        <%
                            }
                        %>
                        <input type="hidden" name="total_productos" value="<%= productos.size() %>">
                        <%
                            }
                        %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="4" class="text-end"><strong>Total:</strong></td>
                            <td id="total-final">$0</td>
                        </tr>
                        </tfoot>
                    </table>
                </div>

                <input type="hidden" name="total_general" id="total_general_input" value="0">

                <div class="text-end mt-3">
                    <button class="btn btn-primary" type="submit">Generar Factura</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    function calcularFila(input) {
        const fila = input.closest('tr');
        const precioTexto = fila.querySelector('.precio-valor').textContent.replace('$', '').replace(/\./g, '');
        const precio = parseInt(precioTexto);
        const cantidad = parseInt(input.value) || 0;
        const total = precio * cantidad;

        fila.querySelector('.total-fila').textContent = '$' + total.toLocaleString('es-CL');

        calcularTotalFinal();
    }

    function calcularTotalFinal() {
        const totales = document.querySelectorAll('.total-fila');
        let totalFinal = 0;

        totales.forEach(td => {
            const valor = parseInt(td.textContent.replace('$', '').replace(/\./g, '')) || 0;
            totalFinal += valor;
        });

        document.getElementById('total-final').textContent = '$' + totalFinal.toLocaleString('es-CL');
        document.getElementById('total_general_input').value = totalFinal;
    }

    // Inicializar los cálculos
    document.addEventListener('DOMContentLoaded', function() {
        const cantidades = document.querySelectorAll('.cantidad-input');
        cantidades.forEach(input => calcularFila(input));
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>