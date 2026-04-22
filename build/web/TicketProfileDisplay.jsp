<%-- 
    Document   : ProfileDisplay
    Created on : 07-Mar-2024, 10:10:06 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.AddFlight" %>
<%@page import="com.web.project.entities.Message" %>
<%@page import="com.web.project.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error_page.jsp"%>
<%
    AddFlight flight=(AddFlight)session.getAttribute("booking");
    if(flight==null){
     response.sendRedirect("Error_page.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
       
        <h1>Hello World!</h1>
                <%
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String Address=request.getParameter("address");
            String flightclass=flight.getFlightclass();
            int price=flight.getprice();
            out.print("<h2>name: "+name+"</h2>");
            out.print("<h2>email: "+email+"</h2>");
            out.print("<h2>phone:"+phone+"</h2>");
            out.print("<h2>Address: "+Address+"</h2>");
            out.print("<h2>Flightclass: "+flightclass+"</h2>");
            out.print("<h2>Flightclass: "+price+"</h2>");
            if(flightclass.equals("Economy")){
              out.print("<h2>Flightclass: "+flightclass+"</h2>");
              int money=(70*price)/100;
              out.print(money);
            }
            if(flightclass.equals("Business")){
              out.print("<h2>Flightclass: "+flightclass+"</h2>");
              int money=(80*price)/100;
              out.print(money);
            }
            else{
            out.print("<h2>Flightclass: "+flightclass+"</h2>");
            int money=(100*price)/100;
              out.print(money);
            }
            %>
        <form action="BookingPayment.jsp" method="post">
            <table>
            <input type="hidden" name="flight-name" value="<%= name %>">
            <h2><%= flight.getFrom() %></h2>
            <h2><%=flight.getFlightclass() %></h2>
            </table>
            <button type="submit" class="btn btn-primary">Submit</button>   
        </form>
        
    </body>
</html>
