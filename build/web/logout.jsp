<%-- 
    Document   : logout
    Created on : 19 Jan, 2017, 2:07:25 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.invalidate();
            response.sendRedirect("homepage.html"); 
        %>
    </body>
</html>
