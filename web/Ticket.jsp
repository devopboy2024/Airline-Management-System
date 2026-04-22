<%-- 
    Document   : Ticket
    Created on : 06-Mar-2024, 3:39:01 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@page import="com.web.project.dao.UserDao"%>
<%@page import="com.web.project.helper.ConnectionProvider"%>
<%@ page import="java.sql.Connection" %>
<%--<%@ page import="com.web.project.model.Flight" %>--%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.format.DateTimeFormatter"%>
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
    <body style="background:url('./assets/img/nav.jpg');background-size: cover">
    <% 
        String search_from =request.getParameter("from");
        String search_to =request.getParameter("to");
        String depature=request.getParameter("depart");
        String flightclass=request.getParameter("class");
        DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyyy");
         LocalDate departureDate = LocalDate.parse(depature);
        String depaturedate=departureDate.format(df);
        
      UserDao dao=new UserDao(ConnectionProvider.getconnection());
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try{
      con=ConnectionProvider.getconnection();
      String queryy="select * from addflight where depfrom=? AND desto=? AND dep=?";
      pstmt=con.prepareStatement(queryy);
      pstmt.setString(1,search_from);
      pstmt.setString(2,search_to);
      pstmt.setString(3,depaturedate);
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
  
      </table>


<!--start model-->
<style>
    .btn-search{
        margin-top: 50px;
     display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 400px;
    }
    .btn-search button{
          font-size: 20px; /* Adjust the font size as needed */
    padding: 10px 20px;
    }
    .data{
       margin-left: 125px;
       border:2px solid;
    }
    </style>
<!-- Button trigger modal -->
<div class="btn-search">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Click For Book Now
</button>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">AIR BUS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="box">
    <form  action="BookingServlet" method="post">
        <div class="form">
            <h3 style="text-align: center;"> ENTER FLIGHT ID</h3>
        </div>
        <input class="data" type="text" placeholder="Enter Flight Id" name="flight-id">
        <input type="hidden" name="flight-class" value="<%= flightclass %>">
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>   
      </div>
         </form>
    </div>
  </div>
</div>
    <footer class="text-center" style="color:white;background:url('IMG/nav.jpg'); margin-bottom:0px; margin-top:4px; padding-top:3%; padding-bottom:4px; border-top:2px solid black;">
	<h6 style="font-size: 30px"> Airlines 2024 &copy All Rights Reserved.</h6>
				<p><i>Web-site designed by  <a href="https://www.linkedin.com/in/shubham-raj-4664b4188/">Shubham Raj</a></i></p>
</footer>
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
