<%-- 
    Document   : Demo
    Created on : 7 Jan, 2017, 8:49:56 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <style>
            #play{
                width: 25%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
                String name=(String)session.getAttribute("name");
        %>
        <h1> Welcome <%=name%></h1>
        <form>
            <a id="play" href="trailrun.jsp" > Play Game</a>
        </form>
    </body>
</html>
