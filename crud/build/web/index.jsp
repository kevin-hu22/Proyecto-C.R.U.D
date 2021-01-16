
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>TRABAJO C.R.U.D</title>
    </head>
    <body>
        <h1 align="center" class="titulo">Bienvenidos</h1>
        <hr>
        <div class="container">
            <a class="tr" class="btn btn-success btn-sm" href="agredar.jsp"> >Agregar</a>
            <a class="tr" class="boton2" href="./clientes/clientes.jsp">  >Registros De Clientes</a>
            <a class="tr" class="boton3" href="./boletas/boletas.jsp">  >Boletas</a>
            <br>
            <br>
        </div>
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            PreparedStatement ps;
            ResultSet rs;
            String sql = "select * from pelicula";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            %>
            <div class="container">
                <table class="table table-border">
                    <tr class="tr">
                        <th class="text-center">Nro de peliculas</th>
                        <th class="text-center">Titulo</th>
                        <th class="text-center">Tipo</th>
                        <th class="text-center">Categoria</th>
                        <th class="text-center">Actor Principal</th>
                        <th class="text-center">Precio Actual</th>
                        <th class="text-center">Stock</th>
                        <th class="text-center">Saldo</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                   
                    <% 
                    while(rs.next()){
                    %>
                    <tr class="tr">
                        <td class="text-center"><%=rs.getInt("Idpeliculas")%></td>
                        <td class="text-center"><%=rs.getString("Titulo")%></td>
                        <td class="text-center"><%=rs.getString("Tipo")%></td>
                        <td class="text-center"><%=rs.getString("Categoria")%></td>
                        <td class="text-center"><%=rs.getString("Actor_Principal")%></td>
                        <td class="text-center"><%=rs.getString("Precio_Actual")%></td>
                        <td class="text-center"><%=rs.getString("Stock")%></td>
                        <td class="text-center"><%=rs.getString("Saldo")%></td>
                        <td class="text-center">
                            <a class="btn btn-warning btn-sm" href="editar.jsp?id=<%=rs.getInt("Idpeliculas")%>">Editar</a>
                            <a class="btn btn-danger btn-sm" href="eliminar.jsp?id=<%=rs.getInt("Idpeliculas")%>">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                        %>
                </table>
            </div>
    </body>
</html>
