<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/clientes.css" rel="stylesheet" type="text/css"/>
        <title>CREATIVE</title>
    </head>
    <body>
       
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            
            PreparedStatement ps;
            String NroBoleta, Fecha_Alquiler, idClientes;
                
                NroBoleta = request.getParameter("txtNrob");
                Fecha_Alquiler= request.getParameter("txtfech");
                idClientes= request.getParameter("txtidcli");
            
            if((NroBoleta!=null)&&(Fecha_Alquiler!=null)&&(idClientes!=null)){
                
                ps = con.prepareStatement("INSERT INTO boleta(NroBoleta, Fecha_Alquiler,idClientes) VALUES('"+NroBoleta+"','"+Fecha_Alquiler+"','"+idClientes+"')");
                ps.executeUpdate();
                response.sendRedirect("boletas.jsp");

            }
            %>
            <div class="container">
                <h1 class="tr" class="text-center"> Agregar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width:500px; height:290px">
                    Nro Boleta:
                    <input type="text" name="txtNrob" class="form-control">
                    Fecha de Alquiler:
                    <input type="text" name="txtfech" class="form-control">
                    Nro Cliente:
                    <input type="text" name="txtidcli" class="form-control">                   
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="boletas.jsp">Regresar</a>
                </form>
            </div>    
    </body>
</html>