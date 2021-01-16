<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/clientes.css" rel="stylesheet" type="text/css"/>

        <title>-UDPATE</title>
    </head>
    <%
             try{
                
                Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
                PreparedStatement ps;
                ResultSet rs;
                int Id= Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("SELECT * FROM detalleboleta WHERE Id="+Id);
                rs = ps.executeQuery();
            
                while (rs.next()){
            %>
    <body>
            <div class="container">
                <h1 class="tr" class="text-center"> Editar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width: 450px; height: 510px">
                    Numero:
                    <input type="text" readonly="" class="form-control" value="<%=rs.getString("Id")%>">
                    Nro de Boleto:
                    <input type="text" name="txtbol" class="form-control" value="<%=rs.getString("NroBoleta")%>">
                    Nro de Peliculas:
                    <input type="text" name="txtpelis" class="form-control"  value="<%=rs.getString("Idpeliculas")%>">
                    Precio Alquilado:
                    <input type="text" name="txtpreA" class="form-control"value="<%=rs.getString("Precio_Alquilado")%>">
                    Devuelto:
                    <input type="text" name="txtdevuelto" class="form-control"value="<%=rs.getString("Devuelto")%>">
                    Fecha Alquilado:
                    <input type="text" name="txtfechad" class="form-control"value="<%=rs.getString("Fecha_Devolucion")%>">
                    DiasMora:
                    <input type="text" name="txtdm" class="form-control"value="<%=rs.getString("DiasMora")%>">
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="Detalles.jsp">Regresar</a>
                </form>
                <% } %>
            </div> 
    </body>
    <% 
                String  NroBol, Idpelic, Pre_A, Dev, Fec_D,DM;
                
               
                NroBol= request.getParameter("txtbol");
                Idpelic= request.getParameter("txtpelis");
                Pre_A= request.getParameter("txtpreA");
                Dev= request.getParameter("txtdevuelto");
                Fec_D= request.getParameter("txtfechad");
                DM= request.getParameter("txtdm");
                
                
                if((NroBol!=null)&&(Idpelic!=null)&&(Pre_A!=null)&&(Dev!=null)&&(Fec_D!=null)&&(DM!=null)){
                
                    ps = con.prepareStatement("UPDATE deatlleboleta SET NroBoleta='"+NroBol+"',Idpeliculas='"+Idpelic+"',Precio_Alquilado='"+Pre_A+"'Devuelto='"+Dev+"',Fecha_Devolucion='"+Fec_D+"',DiasMora='"+DM+"' WHERE Id="+Id);
                    ps.executeUpdate();
                    response.sendRedirect("Detalles.jsp");
                }
                
            }catch(Exception e){
                out.print("Tienes un error:" +e);  
           }
    %>

</html>
 