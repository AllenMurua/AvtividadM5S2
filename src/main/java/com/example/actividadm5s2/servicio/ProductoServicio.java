package com.example.actividadm5s2.servicio;

import com.example.actividadm5s2.objects.Producto;

import java.util.ArrayList;

public class ProductoServicio {
    private ArrayList<Producto> Productos = new ArrayList<Producto>();

    public ProductoServicio() {
        Productos.add(new Producto("Smartphone", "Teléfono inteligente con cámara de alta resolución", 500000));
        Productos.add(new Producto("Laptop", "Computadora portátil de alta performance", 1000000));
        Productos.add(new Producto("Tablet", "Dispositivo móvil con pantalla táctil", 300000));
        Productos.add(new Producto("Smartwatch", "Reloj inteligente con funciones de seguimiento de salud", 250000));
        Productos.add(new Producto("Auriculares inalámbricos", "Auriculares con cancelación de ruido", 150000));
        Productos.add(new Producto("Consola de videojuegos", "Dispositivo para jugar videojuegos", 400000));
        Productos.add(new Producto("Altavoz inteligente", "Altavoz con asistente virtual", 100000));
        Productos.add(new Producto("Smart TV", "Televisor inteligente con acceso a internet", 800000));
        Productos.add(new Producto("Drone", "Vehículo aéreo no tripulado para fotografía y video", 500000));
        Productos.add(new Producto("Raspberry Pi", "Mini computadora de placa única", 50000));

    }

    public ArrayList<Producto> getProductos() {
        return Productos;
    }
    public void setProductos(ArrayList<Producto> Productos) {
        this.Productos = Productos;
    }
}
