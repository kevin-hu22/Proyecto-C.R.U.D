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
            
            int NroB = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("delete from boleta where NroBoleta="+NroB);
            ps.executeUpdate();
            response.sendRedirect("boletas.jsp");
        %>
    </body>
</html>