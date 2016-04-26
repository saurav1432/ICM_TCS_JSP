<%-- 
    Document   : logout
    Created on : Apr 5, 2016, 2:42:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();  
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
