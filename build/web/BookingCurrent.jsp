<%-- 
    Document   : FlightUserView
    Created on : 13-Feb-2024, 12:25:07 am
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
<!--   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
    <!--table-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="JS/FlightView.js" type="text/javascript"></script>
   
</head>


<!--<body style="background-color:whitesmoke">-->
<body style="background-color:black;  background: url('./assets/img/dashboard.jpg'); background-size:">
     <footer class="text-center" style="color:white;background:url('IMG/nav.jpg'); margin-bottom:0px; margin-top:1px; padding-top:1%; padding-bottom:4px; border-top:2px solid black; text-align: center">
	<!--<h6 style="font-size: 10px"> Airlines 2024 &copy All Rights Reserved.</h6>-->
 <h1 style = "color:white; text-align:center;">Current Bookings</h1>
				<!--<p><i>Web-site designed by  <a href="https://www.linkedin.com/in/shubham-raj-4664b4188/">Shubham Raj</a></i></p>-->
</footer>--> 
                <!--<h1 style = "color:white; text-align:center;">Current Bookings</h1>-->
<table id="example" class="table table-dark table-bordered  table-hover" style="width:100%;height:50%" border="2">
    <thead>
 <tr>
            <th>id</th>
		<th>Username</th>
          <th>Email</th>
<!--            <th >Mobile</th>
              <th >Address</th>-->
               <th>F-name</th>
                  <th>F-class</th>
                  <th>F-id</th>
                  <th>From</th>
                   <th>TO</th>
                    <th>Depature Date</th>
                    <th>Depature time</th>
                    <th>Arrival time</th>
                    <!--<th>money </th>-->
                    <th>Status</th>	
            </tr>
    </thead>
    <!--<tbody>-->
    <%
        Connection con = null;
        Statement statement=null;
        ResultSet set=null;
        try {
            
       Class.forName("com.mysql.cj.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/connection","root","system");  
        statement=con.createStatement();
        set=statement.executeQuery("select * from flightprofile");
        while(set.next()) {
    %>
           
    <tr>
                      <td><%=set.getString(1)%></td>
                    <td><%=set.getString(2)%></td>
                    <td><%= set.getString(3) %></td>

                    <td><%= set.getString(6) %></td>
                    <td><%= set.getString(7) %></td>
                    <td><%= set.getString(8) %></td>
                    <td><%= set.getString(9) %></td>
                     <td><%= set.getString(10)%></td>
                    <td><%= set.getString(11) %></td>
                    <td><%= set.getString(12) %></td>
                    <td><%= set.getString(13) %></td>
                    
                   <td><%= set.getString(17) %></td>
                    
                    <!--<td><button type="submit" class="btn btn-success" value="" data-toggle="modal" data-target="#exampleModalCenter">Edit</button></td>-->
                </tr>
    <%
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
    <!--</tbody>-->
    <tfoot>
    <tr>
         <th>id</th>
        <th>DepatureDate</th>
        <th>DepatureTime</th>
        <th>ArrivalDate</th>
        <th>ArrivalTime</th>
        <th>From</th>
        <th>To</th>
        <th>Duration</th>
        <th>Price</th>
        <th>Airline</th>
        <th>Totalseat</th> 
        <th>  </th>
    </tr>
    </tfoot>
</table>
                                                                      <br><br>
                     <footer class="text-center" style="color:white;background:url('IMG/nav.jpg'); margin-bottom:0px; margin-top:4px; padding-top:3%; padding-bottom:4px; border-top:2px solid black; text-align: center">
	<!--<h6 style="font-size: 10px"> Airlines 2024 &copy All Rights Reserved.</h6>-->
				<p><i>Web-site designed by  <a href="https://www.linkedin.com/in/shubham-raj-4664b4188/">Shubham Raj</a></i></p>
</footer>
</body>
</html>

