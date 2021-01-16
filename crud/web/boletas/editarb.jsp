
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/clientes.css" rel="stylesheet" type="text/css"/>
<title>UDPATE</title>
    </head>
    <%
             try{
                
                 Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplar","root","12345");
            
                PreparedStatement ps;
                ResultSet rs;
                int NroB = Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("SELECT * FROM boleta WHERE NroBoleta="+NroB);
                rs = ps.executeQuery();
            
                while (rs.next()){
            %>
    <body>
        
            <div class="container">
                <h1 class="tr" class="text-center"> Editar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width: 400px; height: 300px">
                    Nro de Boleto:
                    <input type="text" name="txtNrob" class="form-control"value="<%=rs.getString("NroBoleta")%>">
                    Fecha de Alquiler:
                    <input type="text" name="txtfech" class="form-control"value="<%=rs.getString("Fecha_Alquiler")%>">
                    Nro del Cliente:
                    <input type="text" name="txtidcli" class="form-control"value="<%=rs.getString("idClientes")%>">
                    <br>
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-sm">
                    <a href="boletas.jsp">Regresar</a>
                </form>
                <% } %>
            </div> 
    </body>
    <% 
                String NroBoleta, Fecha_Alquiler, idClientes;
                
                NroBoleta = request.getParameter("txtNrob");
                Fecha_Alquiler= request.getParameter("txtfech");
                idClientes= request.getParameter("txtidcli");
              
                
                if((NroBoleta!=null)&&(Fecha_Alquiler!=null)&&(idClientes!=null)){
                
                    ps = con.prepareStatement("UPDATE boleta SET NroBoleta='"+NroBoleta+"',Fecha_Alquiler='"+Fecha_Alquiler+"',idClientes='"+idClientes+"' WHERE NroBoleta="+NroB);
                    ps.executeUpdate();
                    response.sendRedirect("boletas.jsp");
                }
                
            }catch(Exception e){
                out.print("Tienes un error:" +e);  
           }
    %>
</html>
