<%-- 
    Document   : principal
    Created on : Aug 2, 2018, 6:40:20 PM
    Author     : fernando
--%>

<%//seguridad del sistema%>
<%
    if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desarrollo de Aplicaciones Web</title>
        <link href="tareadevappvan_file.css" rel="stylesheet" type="text/css"/>
        <style>
        body {
            background-image: url("image.jpg");
        }
        </style>
    </head>
    <body>
        <div class="w-container">
            <h1>Hello World!</h1>
            <a href="listar.jsp?clase=daw&campus=ceutec">
                Listar
            </a>
            <br>
            <a href="nuevo.jsp">
                Nuevo
            </a>
            <br>
            <a href="modificar.jsp">
                Modificar
            </a>
            <br>
            <a href="eliminar.jsp">
                Eliminar
            </a>
            <br>
            <%// explicar los links con parametros%>
            <%//<a href="curso.jsp?g_nombre=programacionI&g_semestre=2"> ir a page </a>%>
        </div>
    </body>
</html>
