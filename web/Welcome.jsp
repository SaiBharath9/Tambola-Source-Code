<%-- 
    Document   : Welcome
    Created on : 7 Jan, 2017, 5:49:25 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            String email=request.getParameter("Email");
            out.print("welcome "+email);
            out.println("Hello"+email.substring(0, 10));
         %>
    </body>
</html>
