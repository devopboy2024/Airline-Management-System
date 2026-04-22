<%-- 
    Document   : BookingPayment
    Created on : 07-Mar-2024, 8:13:41 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String Name=request.getParameter("flight-name");
            out.print(Name);
            %>
    </body>
</html>
