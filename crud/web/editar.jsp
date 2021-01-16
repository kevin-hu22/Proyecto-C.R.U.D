
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/clientes.css" rel="stylesheet" type="text/css"/>
        <title>-UDPATE</title>
    </head>
    <%
             try{
                
                Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
                PreparedStatement ps;
                ResultSet rs;
                int Idpeli = Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("SELECT * FROM pelicula WHERE Idpeliculas="+Idpeli);
                rs = ps.executeQuery();
            
                while (rs.next()){
            %>
    <body>

            <div class="container">
                <h1 class="tr" class="text-center"> Editar Registro de Peliculas</h1>
                <hr>
                <form  action="" method="post" class="form-control" style="width: 530px; height: 580px">
                    Nro Pelicula
                    <input type="text" readonly="" class="form-control" value="<%=rs.getString("Idpeliculas")%>">
                    Titulo:
                    <input type="text" name="txttitulo" class="form-control" value="<%=rs.getString("Titulo")%>">
                    Tipo:
                    <input type="text" name="txttipo" class="form-control"  value="<%=rs.getString("Tipo")%>">
                    Categoria:
                    <input type="text" name="txtcategoria" class="form-control"value="<%=rs.getString("Categoria")%>">
                    Actor Principal:
                    <input type="text" name="txtactorP" class="form-control"value="<%=rs.getString("Actor_Principal")%>">
                    Precio Actual:
                    <input type="text" name="txtprecioA" class="form-control"value="<%=rs.getString("Precio_Actual")%>">
                    Stock:
                    <input type="text" name="txtstock" class="form-control"value="<%=rs.getString("Stock")%>">
                    Saldo:
                    <input type="text" name="txtsaldo" class="form-control"value="<%=rs.getString("Saldo")%>">
                    <br>
                    <input type="submit" value="Guardar"  class="btn btn-primary btn-sm">
                    <a href="index.jsp">Regresar</a>
                </form>
                <% } %>
            </div> 
            </body>
    
    
</html>

            <% 
                String titu, tip, ca, ap, pa, stk, sld;
                
                titu = request.getParameter("txttitulo");
                tip= request.getParameter("txttipo");
                ca= request.getParameter("txtcategoria");
                ap= request.getParameter("txtactorP");
                pa= request.getParameter("txtprecioA");
                stk= request.getParameter("txtstock");
                sld= request.getParameter("txtsaldo");
                
                if((titu!=null)&&(tip!=null)&&(ca!=null)&&(ap!=null)&&(pa!=null)&&(stk!=null)&&(sld!=null)){
                
                    ps = con.prepareStatement("UPDATE pelicula SET Titulo='"+titu+"',Tipo='"+tip+"',Categoria='"+ca+"',Actor_Principal='"+ap+"',Precio_Actual='"+pa+"',Stock='"+stk+"',Saldo='"+sld+"' WHERE Idpeliculas="+Idpeli);
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");
                }
                
            }catch(Exception e){
                out.print("Tienes un error:" +e);  
           }
    %>
    