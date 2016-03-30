<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
        <%@include file="MasterPages/Script.jsp" %>
        <link rel="stylesheet" href="CSS/Tabla.css">
    </head>
    <body background = "http://img.webme.com/pic/n/nesbet/wallpapers5.png">
        <%@include file="MasterPages/HearderCrud.jsp"%>
        <%! int id = 0;%>

        <%
            if (request.getParameter("Buscar") != null) {
                String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                String url = "jdbc:sqlserver://localhost:1433;databaseName=dbSportShop;user=Wlacho;password=wladimir";
                Class.forName(driver);
                Connection conn = null;
                try {
                    conn = DriverManager.getConnection(url);
                    id = Integer.parseInt(request.getParameter("ID"));
                    String sql = "select * from tblProductos where Id like " + id;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    if (rs.next()) {
        %>

        <form action="Eliminar.jsp" method="post" class='contacto'>
            <hr>
            <div><label>Nombre:</label></div>
            <div><label><input type="text" name="nombre" value="<%= rs.getString(2)%>" disabled/></label></div>

            <div><label>Precio:</label></div>
            <div><label><input type="number" name="precio" value="<%= rs.getInt(3)%>" disabled/></label></div>

            <div><label>Tipo:</label></div>
            <div><label><input type="text" name="precio" value="Tipo <%= rs.getString(4)%>" disabled/></label></div>

            <div><label>Cantidad:</label></div>
            <div><label><input type="number" name="cantidad" value="<%= rs.getInt(5)%>" disabled/></label></div>

            <div><input type="submit" name="Eliminar" value="Eliminar"></div>
            <hr>
        </form>

        <%        rs.close();
                        rs = null;
                        stmt.close();
                        stmt = null;
                        if (conn != null) {
                            conn.close();
                        }
                    } else {
                        String mensaje = "<script language='javascript'>alert('No se encontro');</script>";
                        out.println(mensaje);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>


        <%
            if (request.getParameter("Eliminar") != null) {
                String eliminar;
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                String strcon = "jdbc:sqlserver://localhost:1433;databaseName=dbSportShop;user=Wlacho;password=wladimir";
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    con = DriverManager.getConnection(strcon);
                    st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_UPDATABLE);

                    eliminar = "DELETE FROM tblProductos WHERE Id = " + id;

                    st.executeUpdate(eliminar);

                    String mensaje = "<script language='javascript'>alert('Modificacion Exitosa');</script>";
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


        <form action="Eliminar.jsp" method="post" class="contacto">
            <hr>
            <div><label>Id Del Producto:</label></div>
            <div><label><input title="Se necesita un codigo 'ID'" type="number" name="ID" required/></label></div>

            <div><input type="submit" name="Buscar" value="Buscar"></div>
            <hr>
        </form>
    </body>
</html>
