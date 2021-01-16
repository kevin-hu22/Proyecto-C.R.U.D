<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE</title>
    </head>
    <body>
       
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar", "root", "12345");

            PreparedStatement ps;
            
            int Id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("delete from detalleboleta where Id="+Id);
            ps.executeUpdate();
            response.sendRedirect("Detalles.jsp");
        %>
    </body>
</html>