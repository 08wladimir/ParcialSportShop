
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar</title>
        <%@include file="MasterPages/Script.jsp" %>
        <link rel="stylesheet" href="CSS/Tabla.css">

        <script>
            function cargarDeNuevo() {
                window.location = "Comprar.jsp";
            }
        </script>

    </head>
    <body background = "http://img.webme.com/pic/n/nesbet/wallpapers5.png">
    <center>
        <img src="https://www.sportsshoes.com/media/image/sportsshoes-logo.svg">
    </center>
    <%@include file="MasterPages/Hearder.jsp"%>

    <%
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=dbSportShop;user=Wlacho;password=wladimir";
        Class.forName(driver);
        Connection conn = null;
    %>



    <%
        if (request.getParameter("Confirmar Compra") != null) {
            int total = 0;
    %>

    <form action="Comprar.jsp">
        <center><table class='contacto' width="60%">
                <tr>
                    <td colspan= "6"><center><div><label>Usted a comprado lo siguiente</label></div></center></td>
                </tr>

                <tr>
                    <td><div><label>ID</label></div></td>
                    <td><div><label>Nombre</label></div></td>
                    <td><div><label>Precio</label></div></td>
                    <td><div><label>Tipo</label></div></td>
                    <td><div><label>Cantidad</label></div></td>
                    <td><div><label>  </label></div></td>
                </tr>

                <%
                    try {
                        conn = DriverManager.getConnection(url);
                        String sql = "select * from tblProductos";
                        Statement stmt = conn.createStatement();
                        Statement st = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            out.println(total);
                            int iden = rs.getInt(1);
                            String nom = rs.getString(2);
                            int pre = rs.getInt(3);
                            String tip = rs.getString(4);
                            int cant = rs.getInt(5);

                            int c = Integer.parseInt(request.getParameter(nom));
                            if (c != 0) {
                                int t = c * pre;
                                total = t + total;


                %>

                <tr>
                    <td><div><label><%= iden%></label></div></td>
                    <td><div><label><%= nom%></label></div></td>
                    <td><div><label><%= pre%></label></div></td>
                    <td><div><label><%= tip%></label></div></td>
                    <td><div><label><%= c%></label></div></td>
                    <td><div><label><%= t%></label></div></td>
                </tr>

                <%                                        String modificar = "UPDATE tblProductos SET  Cantidad = " + (cant - c) + " WHERE Id = " + iden;
                            st.executeUpdate(modificar);
                        }
                    }


                %>

                <tr>
                    <td><div><label></label></div></td>
                    <td><div><label></label></div></td>
                    <td><div><label></label></div></td>
                    <td><div><label></label></div></td>
                    <td><div><label>Total pagado:</label></div></td>
                    <td><div><label><%= total%></label></div></td>
                </tr>
                <tr>
                    <td colspan= "6"><center><div><input type="submit" name="Volver a Comprar" value="Volver a Comprar"></div></center></td>
                </tr>

                <%                rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                %>

            </table></center>
    </form>

    <%    } else {
    %>

    <form action='Comprar.jsp' method="post">

        <%            try {
                conn = DriverManager.getConnection(url);
                String sql = "select * from tblProductos";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

        %>

        <center><table class='contacto' width="60%">
                <tr>
                    <td colspan= "6"><center><div><label>Compra</label></div></center></td>
                </tr>

                <tr>
                    <td><div><label>  </label></div></td>
                    <td><div><label>ID</label></div></td>
                    <td><div><label>Nombre</label></div></td>
                    <td><div><label>Precio</label></div></td>
                    <td><div><label>Tipo</label></div></td>
                    <td><div><label>Cantidad</label></div></td>
                </tr>

                <%                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String nombre = rs.getString(2);
                        int precio = rs.getInt(3);
                        String tipo = rs.getString(4);
                        int cantidad = rs.getInt(5);

                %>
                <tr>
                    <td>
                        <div>
                            <label>
                                <SELECT NAME="<%= nombre%>"> 
                                    <%
                                        for (int i = 0; i <= cantidad; i++) {
                                    %> 

                                    <OPTION VALUE="<%=i%>"><%=i%></OPTION>

                                    <%
                                        }
                                    %>
                                </SELECT>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div><label><%= id%></label></div>

                    </td>
                    <td>
                        <div><label><%= nombre%></label></div>
                    </td>
                    <td>
                        <div><label><%= precio%></label></div>
                    </td>
                    <td>
                        <div><label><%= tipo%></label></div>
                    </td>
                    <td>
                        <div><label><%= cantidad%></label></div>
                    </td>
                </tr>

                <%
                    }
                %>

                <tr>
                    <td colspan= "6"><center><div><input type="submit" name="Confirmar Compra" value="Confirmar Compra"></div></center></td>
                </tr>
            </table>
        </center>
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
    </form>

    <%
        }
    %>


</body>
</html>