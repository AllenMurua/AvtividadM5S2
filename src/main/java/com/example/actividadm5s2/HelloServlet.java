package com.example.actividadm5s2;

import java.io.*;
import java.util.ArrayList;
import com.example.actividadm5s2.objects.Producto;
import com.example.actividadm5s2.servicio.ProductoServicio;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private ProductoServicio productoServicio;

    @Override
    public void init() {
        productoServicio = new ProductoServicio();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ArrayList<Producto> productos = productoServicio.getProductos();
            req.setAttribute("productos", productos);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);



        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Recuperar datos del formulario
            String nombre = req.getParameter("nombre");
            String direccion = req.getParameter("direccion");
            int totalProductos = Integer.parseInt(req.getParameter("total_productos"));
            int totalGeneral = Integer.parseInt(req.getParameter("total_general"));

            // Establecer los atributos para la página de factura
            req.setAttribute("nombre", nombre);
            req.setAttribute("direccion", direccion);
            req.setAttribute("total_productos", totalProductos);
            req.setAttribute("total_general", totalGeneral);

            // Redirigir a la página de factura
            req.getRequestDispatcher("/factura.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la factura");
        }
    }
}