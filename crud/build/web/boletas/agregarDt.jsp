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
            String Id, NroBoleta, Idpeliculas, Precio_Alquilado, Devuelto, Fecha_Devolucion,DiasMora;
                Id = request.getParameter("txtid");
                NroBoleta= request.getParameter("txtboletoN");
                Idpeliculas= request.getParameter("txtpeliculaS");
                Precio_Alquilado= request.getParameter("txtprecioA");
                Devuelto= request.getParameter("txtdevueltO");
                Fecha_Devolucion= request.getParameter("txtfehaA");
                DiasMora= request.getParameter("txtdiasmorA");
                
                
                if((Id!=null)&&(NroBoleta!=null)&&(Idpeliculas!=null)&&(Precio_Alquilado!=null)&&(Devuelto!=null)&&(Fecha_Devolucion!=null)&&(DiasMora!=null)){
                
                    ps = con.prepareStatement("INSERT INTO detalleboleta(Id,NroBoleta,Idpeliculas,Precio_Alquilado,Devuelto,Fecha_Devolucion,DiasMora)VALUES('"+Id+"','"+NroBoleta+"','"+Idpeliculas+"','"+Precio_Alquilado+"','"+Devuelto+"','"+Fecha_Devolucion+"','"+DiasMora+"')") ;
                    ps.executeUpdate();
                    response.sendRedirect("Detalles.jsp");
                }
            
            %>
            <div class="container">
                <h1 class="tr" class="text-center"> Agregar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width:500px; height:510px">
                    Numero:
                    <input type="text" name="txtid" class="form-control">
                    Nro boleta:
                    <input type="text" name="txtboletoN" class="form-control">
                    Nro Pelicula:
                    <input type="text" name="txtpeliculaS" class="form-control">
                    Precio Alquilado:
                    <input type="text" name="txtprecioA" class="form-control">
                    Devuelto:
                    <input type="text" name="txtdevueltO" class="form-control">
                    Fecha Alquilado:
                    <input type="text" name="txtfehaA" class="form-control">
                    DiasMora:
                    <input type="text" name="txtdiasmorA" class="form-control">
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="Detalles.jsp">Regresar</a>
                </form>
            </div>    
    </body>
</html>