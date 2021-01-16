
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/clientes.css" rel="stylesheet" type="text/css"/>
        <title>CREATIVE</title>
    </head>
    <body>
       
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
            
            PreparedStatement ps;
            String Idpeli, titu, tip, ca, ap, pa, stk, sld;
            
            Idpeli = request.getParameter("txtId");
            titu  = request.getParameter("txttitu");
            tip = request.getParameter("txttip");
            ca = request.getParameter("txtca");
            ap =request.getParameter("txtact");
            pa =request.getParameter("txtpreci");
            stk =request.getParameter("txtstk");
            sld=request.getParameter("txtsld");
            
            if((Idpeli!=null)&&(titu!=null)&&(tip!=null)&&(ca!=null)&&(ap!=null)&&(pa!=null)&&(stk!=null)&&(sld!=null)){
        
                ps = con.prepareStatement("INSERT INTO pelicula(Idpeliculas, Titulo, Tipo, Categoria, Actor_Principal, Precio_Actual, Stock, Saldo) VALUES('"+Idpeli+"','"+titu+"','"+tip+"','"+ca+"','"+ap+"','"+pa+"','"+stk+"','"+sld+"')");
                ps.executeUpdate();
                response.sendRedirect("index.jsp");
            }
            %>
            <div class="container">
                <h1 class="tr" class="text-center"> Agregar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width:500px; height:580px">
                    Nro Pelicula:
                    <input type="text" name="txtId" class="form-control">
                    Titulo:
                    <input type="text" name="txttitu" class="form-control">
                    Tipo:
                    <input type="text" name="txttip" class="form-control">
                    Categoria:
                    <input type="text" name="txtca" class="form-control">
                    Actor Principal:
                    <input type="text" name="txtact" class="form-control">
                    Precio Actual:
                    <input type="text" name="txtpreci" class="form-control">
                    Stock:
                    <input type="text" name="txtstk" class="form-control">
                    Saldo:
                    <input type="text" name="txtsld" class="form-control">
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="index.jsp">Regresar</a>
                </form>
            </div>    
    </body>
</html>
