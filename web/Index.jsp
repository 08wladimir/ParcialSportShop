
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sport Shop</title>
        <%@include file="MasterPages/Script.jsp" %>
        <link rel="stylesheet" href="CSS/Tabla.css">
    </head>
    <body background = "http://img.webme.com/pic/n/nesbet/wallpapers5.png">
    <center>
        <img src="https://www.sportsshoes.com/media/image/sportsshoes-logo.svg">
    </center>
    <%@include file="MasterPages/Hearder.jsp"%>

    <form action="Index.jsp" class='contacto' width="100">
        <hr>
        <div>
            <SELECT NAME="Tipo"> 
                <OPTION SELECTED VALUE="select * from tblProductos">Todo</OPTION> 
                <OPTION VALUE="select * from tblProductos where Tipo LIKE 'D'">D</OPTION> 
                <OPTION VALUE="select * from tblProductos where Tipo LIKE 'A'">A</OPTION> 
            </SELECT>
        </div>
        <div><input type="submit" value="Buscar" /></div>
        <hr>
    </form>

    <%
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=dbSportShop;user=Wlacho;password=wladimir";
        Class.forName(driver);
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
            String sql = request.getParameter("Tipo");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

    %>

    <center><table class='contacto' width="90%">
            <tr>
                <th><div><label>ID</label></div></th>
                <th><div><label>Nombre</label></div></th>
                <th><div><label>Precio</label></div></th>
                <th><div><label>Tipo</label></div></th>
                <th><div><label>Cantidad</label></div></th>
            </tr>
            <% while (rs.next()) {
                    int id = rs.getInt(1);
                    String nombre = rs.getString(2);
                    int precio = rs.getInt(3);
                    String tipo = rs.getString(4);
                    int cantidad = rs.getInt(5);
            %>
            <tr>
                <td><div><%= id%></div></td>
                <td><div><%= nombre%></div></td>
                <td><div><%= precio%></div></td>
                <td><div><%= tipo%></div></td>
                <td><div><%= cantidad%></div></td>
            </tr>
            <% }%>
            <tr>
                <td colspan= "5">
            <center>
                <div>
                    <a href='Agregar.jsp'>
                        <input type="submit" name="action" value="Agregar"/></a>
                    <a href='Modificar.jsp'>
                        <input type="submit" name="action" value="Modificar"/></a>
                    <a href='Eliminar.jsp'>
                        <input type="submit" name="action" value="Eliminar"/></a>
                </div>
            </center>
            </td>
            </tr>
        </table>
    </center>

</body>
</html>
<%
        rs.close();
        rs = null;
        stmt.close();
        stmt = null;
        if (conn != null) {
            conn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>