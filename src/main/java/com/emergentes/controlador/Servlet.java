package com.emergentes.controlador;

import com.emergentes.model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ALEX
 */
@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("opcion");

        Producto objeto_producto = new Producto();

        HttpSession sesion = request.getSession();

        ArrayList<Producto> lista_producto;
        lista_producto = (ArrayList<Producto>) sesion.getAttribute("lista_producto");

        int id, posicion;

        switch (opcion) {
            case "nuevo":

                request.setAttribute("objeto_producto", objeto_producto);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;

            case "editar":

                id = Integer.parseInt(request.getParameter("id"));
                posicion = buscarIndice(request, id);

                objeto_producto = lista_producto.get(posicion);
                request.setAttribute("objeto_producto", objeto_producto);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;

            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                posicion = buscarIndice(request, id);
                if (posicion >= 0) {
                    lista_producto.remove(posicion);
                }
                request.setAttribute("lista_producto", lista_producto);
                response.sendRedirect("index.jsp");
                break;
            default:

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");

        HttpSession sesion = request.getSession();
        ArrayList<Producto> lista_producto = (ArrayList<Producto>) sesion.getAttribute("lista_producto");

        Producto objeto_producto = new Producto();

        objeto_producto.setId(id);
        objeto_producto.setDescripcion(descripcion);
        objeto_producto.setCantidad(cantidad);
        objeto_producto.setPrecio(precio);
        objeto_producto.setCategoria(categoria);

        if (id == 0) {
            int idNew = obtenerId(request);
            objeto_producto.setId(idNew);
            lista_producto.add(objeto_producto);

        } else {

            int posicion = buscarIndice(request, id);
            lista_producto.set(posicion, objeto_producto);

        }

        request.setAttribute("lista_producto", lista_producto);
        response.sendRedirect("index.jsp");

    }

    public int buscarIndice(HttpServletRequest request, int id) {

        HttpSession sesion = request.getSession();
        ArrayList<Producto> lista_producto = (ArrayList<Producto>) sesion.getAttribute("lista_producto");

        int posicion = -1;

        if (lista_producto != null) {
            for (Producto elemento : lista_producto) {
                ++posicion;
                if (elemento.getId() == id) {
                    break;
                }
            }
        }

        return posicion;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        ArrayList<Producto> lista_producto = (ArrayList<Producto>) sesion.getAttribute("lista_producto");

        int idNew = 0;
        for (Producto elemento : lista_producto) {
            idNew = elemento.getId();

        }
        return idNew + 1;

    }

}
