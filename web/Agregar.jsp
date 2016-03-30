<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="MasterPages/Script.jsp" %>
        <link rel="stylesheet" href="CSS/Tabla.css">
    </head>
    <body background = "http://img.webme.com/pic/n/nesbet/wallpapers5.png">
        <%@include file="MasterPages/HearderCrud.jsp"%>
        <form action="Agregar.jsp" method="post" class='contacto'>
            <hr>
            <div><label>Id:</label></div>
            <div><label><input title="Se necesita una ID" type="number" name="id" required/></label></div>

            <div><label>Nombre:</label></div>
            <div><label><input title="Se necesita un nombre" type="text" name="nombre" required/></label></div>

            <div><label>Precio:</label></div>
            <div><label><input title="Se necesita un precio" type="number" name="precio" required/></label></div>

            <div><label>Tipo:</label></div>
            <div>
                <label>
                    <SELECT NAME="tipo"> 
                        <OPTION VALUE="D">Tipo D</OPTION> 
                        <OPTION VALUE="A">Tipo A</OPTION> 
                    </SELECT>
                </label>
            </div>

            <div><label>Cantidad:</label></div>
            <div><label><input title="Se necesita una cantidad" type="number" name="cantidad" required/></label></div>

            <div><input type="submit" name="Agregar" value="Agregar"></div>
            <hr>
        </form>


        <%
            if (request.getParameter("Agregar") != null) {
                String n, t, agregar;
                int i, p, c;
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                String strcon = "jdbc:sqlserver://localhost:1433;databaseName=dbSportShop;user=Wlacho;password=wladimir";
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    con = DriverManager.getConnection(strcon);
                    st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_UPDATABLE);

                    i = Integer.parseInt(request.getParameter("id"));
                    n = request.getParameter("nombre");
                    p = Integer.parseInt(request.getParameter("precio"));
                    t = request.getParameter("tipo");
                    c = Integer.parseInt(request.getParameter("cantidad"));

                    agregar = "INSERT INTO tblProductos (Id, Nombre, Precio, Tipo, Cantidad) "
                            + "VALUES (" + i + ",'" + n + "'," + p + ",'" + t + "'," + c + ")";

                    st.executeUpdate(agregar);

                    String mensaje = "<script language='javascript'>alert('Agregado correctamente');</script>";
                    out.println(mensaje);

                    rs.close();
                    st.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            ;
        %>

    </body>
</html>
