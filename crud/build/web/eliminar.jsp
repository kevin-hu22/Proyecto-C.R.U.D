<%-- 
    Document   : eliminar
    Created on : 12-abr-2020, 21:11:31
    Author     : kevin HU
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE</title>
    </head>
    <body>
        <h3>Eliminación</h3>
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar", "root", "12345");

            PreparedStatement ps;
            
            int Idpeli = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("delete from pelicula where Idpeliculas="+Idpeli);
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
