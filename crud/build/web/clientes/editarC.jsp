
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
                int idCli = Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("SELECT * FROM clientes WHERE idClientes="+idCli);
                rs = ps.executeQuery();
            
                while (rs.next()){
    %>
    <body>
        
            <div class="container">
                <h1 class="tr" class="text-center"> Editar Registro de Clientes</h1>
                <hr>
                <form action="" method="post" class="form-control" style="padding-top: 10px;  width: 510px; height: 580px">
                    Nro Cliente
                    <input type="text" readonly="" class="form-control" value="<%=rs.getString("idClientes")%>">
                    Nombre:
                    <input type="text" name="txtNom" class="form-control" value="<%=rs.getString("Nombre")%>">
                    Apellido1:
                    <input type="text" name="txtAp1" class="form-control"  value="<%=rs.getString("Apellido1")%>">
                    Apellido2:
                    <input type="text" name="txtAp2" class="form-control"value="<%=rs.getString("Apellido2")%>">
                    Documento:
                    <input type="text" name="txtDoc" class="form-control"value="<%=rs.getString("Documento")%>">
                    Direccion:
                    <input type="text" name="txtDir" class="form-control"value="<%=rs.getString("Direccion")%>">
                    Telefono:
                    <input type="text" name="txtTel" class="form-control"value="<%=rs.getString("Telefono")%>">
                    Celular:
                    <input type="text" name="txtCel" class="form-control"value="<%=rs.getString("Celular")%>">
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="clientes.jsp">Regresar</a>
                </form>
                <% } %>
            </div>
    </body>
    
</html>
<% 
                String  Nom, Ape1, Ape2, Doc, Dir,Tel, Cel;
                
                
                Nom = request.getParameter("txtNom");
                Ape1= request.getParameter("txtAp1");
                Ape2= request.getParameter("txtAp2");
                Doc= request.getParameter("txtDoc");
                Dir= request.getParameter("txtDir");
                Tel= request.getParameter("txtTel");
                Cel= request.getParameter("txtCel");
                
                if((Nom!=null) && (Ape1!=null) && (Ape2!=null) && (Doc!=null) && (Dir!=null) && (Tel!=null) && (Cel!=null)){
                
                    ps = con.prepareStatement("UPDATE clientes SET Nombre='"+Nom+"',Apellido1='"+Ape1+"',Apellido2='"+Ape2+"',Documento='"+Doc+"',Telefono='"+Tel+"',Celular='"+Cel+"'WHERE idClientes="+idCli);
                    ps.executeUpdate();
                    response.sendRedirect("clientes.jsp");
                }
                
            }catch(Exception e){
                out.print("Tienes un error:" +e);  
           }
    %>