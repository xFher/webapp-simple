<%-- 
    Document   : nuevo
    Created on : Aug 2, 2018, 7:05:34 PM
    Author     : fernando
--%>

<%//seguridad del sistema%>
<%
    if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>       
        <title>Agregar nuevo</title>
        <link href="tareadevappvan_file.css" rel="stylesheet" type="text/css"/>
        <style>
        body {
            background-image: url("image.jpg");
        }
        </style>
    </head>
    <body>
        <div class="w-container">
            <%// va de segundo—ve a la siguiente pagina Primero
                if (request.getParameter("bt_crear") != null) {
                    try {
                        Dba db = new Dba(application.getRealPath("daw.mdb"));
                        db.conectar();
                        int contador = db.query.executeUpdate("insert into usuarios"
                                + "(cuenta,nombres,apellidos,usuario,password) "
                                + "values('" + request.getParameter("ti_cuenta") + "'"
                                + ",'" + request.getParameter("ti_nombre") + "'"
                                + ",'" + request.getParameter("ti_apellidos") + "'"
                                + ",'" + request.getParameter("ti_usuario") + "'"
                                + ",'" + request.getParameter("ti_password") + "')");

                        if (contador == 1) {
                            out.print("<script>alert('el usuario se creo correctamente');</script>");
                        }
                        db.commit();
                        db.desconectar();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>

            <h4>Nuevo Usuario</h4>
            <form name="f1" action="nuevo.jsp" method="POST">
                Cuenta
                <input type="text" name="ti_cuenta" value="" /><br> 
                Nombre
                <input type="text" name="ti_nombre" value="" /><br>
                Apellidos
                <input type="text" name="ti_apellidos" value="" /><br>
                Usuario
                <input type="text" name="ti_usuario" value="" /><br>
                Password
                <input type="text" name="ti_password" value="" /><br>
                <input type="submit" value="crear" name="bt_crear" /><br>                      
            </form>
            <a href="principal.jsp">
               <input type="button" value="Cancelar y Regresar" />
            </a>
        </div>
    </body>
</html>
