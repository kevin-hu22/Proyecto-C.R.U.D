<%-- 
    Document   : Detalles
    Created on : 16-abr-2020, 19:31:48
    Author     : kevin HU
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/clientes.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h3 class="titulo" align="center">Detalles del Boleto</h3> <a class="btn-regreso" href="boletas.jsp"> <--Regresar</a>
        <a class="tr" class="btn btn-success btn-sm" href="agregarDt.jsp"> >Agregar</a> 
        <br>
        <br>
        
         <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con= (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM detalleboleta";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            %>
            <div class="container">
                <table  class="table table-border">
                    <tr class="tr">
                        <th class="text-center">Numero</th>
                        <th class="text-center">Nro de Boleto</th>
                        <th class="text-center">Nro de Pelicula</th>
                        <th class="text-center">Precio Alquilado</th>
                        <th class="text-center">Devuelto</th>
                        <th class="text-center">Fecha Devoluvion</th>
                        <th class="text-center">DiasMora</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                   
                    <% 
                    while(rs.next()){
                    %>
                    <tr class="tr">
                        <td class="text-center"><%=rs.getInt("Id")%></td>
                        <td class="text-center"><%=rs.getInt("NroBoleta")%></td>
                        <td class="text-center"><%=rs.getInt("Idpeliculas")%></td>
                        <td class="text-center"><%=rs.getString("Precio_Alquilado")%></td>
                        <td class="text-center"><%=rs.getString("Devuelto")%></td>
                        <td class="text-center"><%=rs.getString("Fecha_Devolucion")%></td>
                        <td class="text-center"><%=rs.getString("DiasMora")%></td>
                        <td class="text-center">
                            <a class="btn btn-warning btn-sm" href="editarDt.jsp?id=<%=rs.getInt("id")%>">Editar</a>
                            <a class="btn btn-danger btn-sm" href="eliminarDt.jsp?id=<%=rs.getInt("id")%>">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                        %>
                </table>
            </div>
    </body>
</html>
