<%-- 
    Document   : clientes
    Created on : 14-abr-2020, 1:15:23
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
        <link href="../css/clientes.css" rel="stylesheet" type="text/css">
    
        <title>Clientes</title>
    </head>
    <body>
        <h3 class="titulo" align="center">Registro de Clientes</h3> <a class="regreso" href="../index.jsp"> <--Regresar</a>
        <a class="tr" class="btn btn-success btn-sm" href="agregarC.jsp"> >Agregar</a> 
        <br>
        <br>
        
         <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con= (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            PreparedStatement ps;
            ResultSet rs;
            String sql = "select * from clientes";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            %>
            <div class="container">
                <table  class="table table-border">
                    <tr class="tr">
                        <th class="text-center">Nro Clientes</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellido 1</th>
                        <th class="text-center">Apellido 2</th>
                        <th class="text-center">Documento</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Celular</th>
                        <th class="text-center">Acciones</th>
                        
                    </tr>
                   
                    <% 
                    while(rs.next()){
                    %>
                    <tr class="tr">
                        <td class="text-center"><%=rs.getInt("idClientes")%></td>
                        <td class="text-center"><%=rs.getString("Nombre")%></td>
                        <td class="text-center"><%=rs.getString("Apellido1")%></td>
                        <td class="text-center"><%=rs.getString("Apellido2")%></td>
                        <td class="text-center"><%=rs.getString("Documento")%></td>
                        <td class="text-center"><%=rs.getString("Direccion")%></td>
                        <td class="text-center"><%=rs.getString("Telefono")%></td>
                        <td class="text-center"><%=rs.getString("Celular")%></td>
                        <td class="text-center">
                            <a class="btn btn-warning btn-sm" href="editarC.jsp?id=<%=rs.getInt("idClientes")%>">Editar</a>
                            <a class="btn btn-danger btn-sm" href="eliminarC.jsp?id=<%=rs.getInt("idClientes")%>">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                        %>
                </table>
            </div>
    </body>
</html>
