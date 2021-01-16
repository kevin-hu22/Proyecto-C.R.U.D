<%-- 
    Document   : boletas
    Created on : 15-abr-2020, 1:35:57
    Author     : kevin HU
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/clientes.css" rel="stylesheet" type="text/css"/>
        <title>Boletas</title>
    </head>
    <body>
        <h3 class="titulo" align="center">Boletas</h3> <a class="btn-regreso" href="../index.jsp"> <--Regresar</a>
        <a class="tr" class="btn btn-success btn-sm" href="agregarB.jsp"> >Agregar</a>
        <a class="tr" class="btn btn-success btn-sm" href="Detalles.jsp"> >Detalles</a>
        <br>
        <br>
        
         <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con= (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            PreparedStatement ps;
            ResultSet rs;
            String sql = "select * from boleta";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            %>
            <div class="container">
                
                <table  class="table table-border">
                    <tr class="tr">
                        <th class="text-center">Nro Boletas</th>
                        <th class="text-center">Fecha de Alquiler</th>
                        <th class="text-center">Clientes</th>
                        <th class="text-center">Aciones</th>
                       
                    </tr>
                   
                    <% 
                    while(rs.next()){
                    %>
                    <tr class="tr">
                        <td class="text-center"><%=rs.getInt("NroBoleta")%></td>
                        <td class="text-center"><%=rs.getString("Fecha_Alquiler")%></td>
                        <td class="text-center"><%=rs.getString("idClientes")%></td>
                        <td class="text-center">
                            <a class="btn btn-warning btn-sm" href="editarb.jsp?id=<%=rs.getInt("NroBoleta")%>">Editar</a>
                            <a class="btn btn-danger btn-sm" href="eliminarB.jsp?id=<%=rs.getInt("NroBoleta")%>">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                        %>
                </table>
            </div>
    </body>
</html>
