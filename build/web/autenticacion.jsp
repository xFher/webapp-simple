<%-- 
    Document   : autenticacion
    Created on : Aug 2, 2018, 6:24:13 PM
    Author     : fernando
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    try {

        Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
        db.conectar();
        db.query.execute(
                "SELECT usuario, password"
                + " FROM usuarios");
        ResultSet rs = db.query.getResultSet();
        String centinela = "n";
        while (rs.next()) {
            if (request.getParameter("ti_usuario").equals(rs.getString(1))
                    && request.getParameter("ti_password").equals(rs.getString(2))) {
                centinela = "s";
            }
        }
        db.desconectar();
        if (centinela.equals("s")) {
            //guardar variables de session
            session.setAttribute("s_user", request.getParameter("ti_usuario"));
            session.setAttribute("s_pass", request.getParameter("ti_password"));
            //llamar jsp correspondiete desde linea de comando
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else {
            out.print("<script>alert('el usuario no existe')</script>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>