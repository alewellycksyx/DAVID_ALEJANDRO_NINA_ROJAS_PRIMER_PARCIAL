<%-- 
    Document   : editar
    Created on : 12 sep 2023, 21:46:40
    Author     : ALEX
--%>

<%@page import="com.emergentes.model.Producto"%>
<%
    Producto registro = (Producto) request.getAttribute("objeto_producto");
    int id = registro.getId();


%>
<!DOCTYPE html>
<html>
    <head>
        <title>REGISTRO Y EDICION</title>
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
                background-color: greenyellow;
            }

            .container {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>REGISTRO DE PRODUCTOS</h2>

            <form action="Servlet" method="post">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>DESCRIPCION</th>
                        <th>CANTIDAD</th>
                        <th>PRECIO</th>
                        <th>CATEGORIA</th>

                    </tr>
                    <tr>

                        <td><input type="text" name="id" value="<%= registro.getId()%>" readonly></td>
                        <td><input type="text" name="descripcion" value="<%= registro.getDescripcion()%>" ></td>
                        <td><input type="number" name="cantidad" value="<%= registro.getCantidad()%>" ></td>
                        <td><input type="number" name="precio" step="0.01" value="<%= registro.getPrecio()%>" ></td>
                        <td><input type="text" name="categoria" value="<%= registro.getCategoria()%>" ></td>

                    </tr>
                </table>
                <input type="submit" value="Registrar">
            </form>
            <br>
            <a href="index.jsp"><button>Cancelar</button></a>

        </div>
    </body>
</html>


