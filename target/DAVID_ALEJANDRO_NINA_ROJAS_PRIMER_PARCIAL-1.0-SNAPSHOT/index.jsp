<%-- 
    Document   : index
    Created on : 12 sep 2023, 21:36:50
    Author     : ALEX
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.model.Producto"%>
<%

    if (session.getAttribute("lista_producto") == null) {
        ArrayList<Producto> lista_auxiliar = new ArrayList<Producto>();

        session.setAttribute("lista_producto", lista_auxiliar);

    }
    ArrayList<Producto> lista_completa = (ArrayList<Producto>) session.getAttribute("lista_producto");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de Productos</title>

        <style>
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 8px;
            }

            th {
                background-color: green;
            }

            .container {
                text-align: center;


            }
        </style>

    </head>
    <body>

        <div class="container">

            <h2>PRIMER PARCIAL TEM-742</h2>
            <h2>Nombre : DAVID ALEJANDRO NINA ROJAS</h2>
            <h2>CARNET: 10070922</h2>
            <br>

            <h2>GESTION DE PRODUCTOS</h2>
            <a href="Servlet?opcion=nuevo"><button>NUEVO PRODUCTO</button></a>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DESCRIPCION</th>
                        <th>CANTIDAD</th>
                        <th>PRECIO</th>
                        <th>CATEGORIA</th>
                        <th>OPCIONES</th>

                    </tr>
                </thead>

                <tbody>
                    <%   if (lista_completa != null) {
                            for (Producto item : lista_completa) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getDescripcion()%></td>
                        <td><%=item.getCantidad()%></td>
                        <td><%=item.getPrecio()%></td> 
                        <td><%=item.getCategoria()%></td>


                        <td>
                            <a href="Servlet?opcion=editar&id=<%= item.getId()%>"><button>EDITAR</button></a>
                            <a href="Servlet?opcion=eliminar&id=<%= item.getId()%>" onclick="return(confirm('ESTA SEGURO DE ELIMINAR EL PRODUCTO ?'))"><button>ELIMINAR</button></a>
                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>



                </tbody>
            </table>
        </div>
    </body>
</html>
