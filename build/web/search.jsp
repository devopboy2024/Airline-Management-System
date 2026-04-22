<%-- 
    Document   : searchFlight
    Created on : 04-Mar-2024, 2:19:53 pm
    Author     : hp
--%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.dao.UserDao"%>
<%@page import="com.web.project.helper.ConnectionProvider"%>
<%@ page import="java.sql.Connection" %>
<%--<%@ page import="com.web.project.model.Flight" %>--%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--table-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="JS/FlightView.js" type="text/javascript"></script>
          <style>
        body{
            background-image: url("IMG/blurSearch.jpg");
            background-size: cover;
        }
    </style> 
    </head>
    <body>
  
    <% 
        String search_from = (String) request.getAttribute("search_from");
        String search_to = (String) request.getAttribute("search_to");
      UserDao dao=new UserDao(ConnectionProvider.getconnection());
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try{
      con=ConnectionProvider.getconnection();
      String queryy="select * from addflight where depfrom=? AND desto=?";
      pstmt=con.prepareStatement(queryy);
      pstmt.setString(1,search_from);
      pstmt.setString(2,search_to);
       rs=pstmt.executeQuery();
        if(!rs.next()){
         response.sendRedirect("noDataFound.jsp");
        }
        else{
//       List<Flight> flights = dao.searchFlights(from, to);
       %>
        <table class="table table-dark table-bordered  table-hover" border="1">
                  <tr>
                <th >ID</th>
                <th>Departure Date</th>
                <th>Departure Time</th>
                <th>Arrival Date</th>
                <th>Arrival Time</th>
                <th>From</th>
                <th>To</th>
                <th>Duration</th>
                <th>Price</th>
                <th>Airline</th>
                <th>Total Seat</th>
                <th></th>
            </tr>
     
            <%
//     while(rs.next()){
      %>
     <% do{
         %>
            <tr>
                             <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td><%= rs.getInt(9) %></td>
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getInt(11) %></td>
            </tr>
            <% 
                }while(rs.next());
//                } //while end over %>
   <footer class="text-center" style="color:white;background:url('IMG/nav.jpg'); margin-bottom:0px; margin-top:4px; padding-top:3%; padding-bottom:4px; border-top:2px solid black;">
	<h6 style="font-size: 30px"> Airlines 2024 &copy All Rights Reserved.</h6>
				<p><i>Web-site designed by  <a href="https://www.linkedin.com/in/shubham-raj-4664b4188/">Shubham Raj</a></i></p>

</footer>
      </table>
      <%      
          }
          }
    catch(Exception e){
       e.printStackTrace();
         }
//  finally {
//        // Close resources
//        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
//        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
//        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
//    }
//finally {
//        // Close resources in finally block to ensure they are always closed
//        try {
//            if (rs != null) rs.close();
//            if (pstmt != null) pstmt.close();
//            if (con != null) con.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
      %>
    </body>
   
</html>
