
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
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
           
            PreparedStatement ps;
            String idCli,Nom, Ape1, Ape2, Doc, Dir,Tel, Cel;
           
            idCli =request.getParameter("txtid");
            Nom= request.getParameter("txtNom");
            Ape1= request.getParameter("txtAp1");
            Ape2= request.getParameter("txtAp2");
            Doc= request.getParameter("txtDoc");
            Dir= request.getParameter("txtDir");
            Tel= request.getParameter("txtTel");
            Cel= request.getParameter("txtCel");
                
            if((idCli!=null)&&(Nom!=null)&&(Ape1!=null)&&(Ape2!=null)&&(Doc!=null)&&(Dir!=null)&&(Tel!=null)&&(Cel!=null)){
                
                ps = con.prepareStatement("INSERT INTO clientes(idClientes,Nombre, Apellido1, Apellido2, Documento, Direccion, Telefono,Celular) VALUES('"+idCli+"','"+Nom+"','"+Ape2+"','"+Ape2+"','"+Doc+"','"+Dir+"','"+Tel+"','"+Cel+"')");
                ps.executeUpdate();
                response.sendRedirect("clientes.jsp");
            }
            %>
            <div class="container">
                <h1 class="tr" class="text-center"> Editar Registro de Clientes</h1>
                <hr>
                <form action="" method="post" class="form-control" style="padding-top: 10px;  width: 450px; height: 580px">
                    Nro Cliente
                    <input type="text" name="txtid" class="form-control" >
                    Nombre:
                    <input type="text" name="txtNom" class="form-control">
                    Apellido1:
                    <input type="text" name="txtAp1" class="form-control" >
                    Apellido2:
                    <input type="text" name="txtAp2" class="form-control">
                    Documento:
                    <input type="text" name="txtDoc" class="form-control">
                    Direccion:
                    <input type="text" name="txtDir" class="form-control">
                    Telefono:
                    <input type="text" name="txtTel" class="form-control">
                    Celular:
                    <input type="text" name="txtCel" class="form-control">
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="clientes.jsp">Regresar</a>
                </form>
            </div>
    </body>
</html>
