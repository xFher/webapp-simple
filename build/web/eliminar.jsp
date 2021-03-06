<%-- 
    Document   : modificar
    Created on : Aug 2, 2018, 7:15:48 PM
    Author     : fernando
--%>
<%//seguridad del sistema%>
<%
    if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<%@page import="database.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="tareadevappvan_file.css" rel="stylesheet" type="text/css"/>
        <style>
        body {
            background-image: url("image.jpg");
        }
        </style>
    </head>
    <body>
        <div class="w-container">
            <%-- paso 3 actualizar los nuevos datos en la base de datos--%>
            <%
                if (request.getParameter("bt_eliminar") != null) {
                    try {
                        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                        db.conectar();

                        int contador = db.query.executeUpdate("DELETE FROM usuarios "
                                + "WHERE cuenta='" + request.getParameter("ti_cuenta") + "' ");

                        if (contador >= 1) {
                            out.print("<script>alert('el usuario fue eliminado correctamente');</script>");
                        }
                        db.commit();
                        db.desconectar();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
            <%-- FIN paso 3--%>

            <%-- paso #1 listar los usuarios--%>
            <h1>Eliminar Usuario</h1>
            <p align="center">
                <b>
                    <font face="Arial" color="#FFFFFF" size="12">Eliminar Usuario
                    </font>
                </b>
            </p>
            <table>
                <thead>
                    <tr>
                        <th>Cuenta</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                    </tr>
                </thead>
                <tbody>
                    <%  //listar los productos que existen en la base de datos
                        try {
                            Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                            db.conectar();
                            db.query.execute("SELECT cuenta,nombres,apellidos,usuario,password FROM usuarios");
                            ResultSet rs = db.query.getResultSet();
                            while (rs.next()) {
                                String v_cuenta = rs.getString(1);
                                String v_nombres = rs.getString(2);
                                String v_apellidos = rs.getString(3);
                                String v_usuario = rs.getString(4);
                                String v_password = rs.getString(5);
                    %>
                    <tr>
                        <td><%=v_cuenta%></td>
                        <td><%=v_nombres%></td>
                        <td><%=v_apellidos%></td>
                        <td><a href="eliminar.jsp?p_cuenta=<%=v_cuenta%>&p_eliminar=1">Eliminar</a></td>
                    </tr>
                    <%
                            }
                            db.desconectar();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
            <%-- FIN paso #1--%>

            <%
                //paso #2 si preciono el link para modificar
                if (request.getParameter("p_eliminar") != null) {
            %>
            <br>
            <hr>
            <form name="f1" action="eliminar.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Cuenta</td>                        
                            <td><input type="text" name="ti_cuenta" value="<%= request.getParameter("p_cuenta")%>" readonly="readonly"  />   </td>
                        </tr>
                        <tr>
                            <td> <input type="submit" value="confirmar eliminar" name="bt_eliminar" />   </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <%
                }
            %>
            <a href="principal.jsp">
               <input type="button" value="Regresar" />
            </a>
        </div>
    </body>
</html>

