<%-- 
    Document   : FlightUserView
    Created on : 13-Feb-2024, 12:25:07 am
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.AddFlight" %>
<%@page import="com.web.project.entities.AddFlight" %>
<%@ page import="java.sql.*" %>
<%@page errorPage="Error_page.jsp"%>
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
</head>
<script>
//    function pageRedirect() {
//        window.location.replace("Demo2.jsp");
////        $("#exampleModalCenter").hide();
//    } 
//    $(document).ready(function() {
//    $('#submit-button').click(function(event){
//        event.preventDefault();
//        pageRedirect();
//    });
//});
   
    $('#submit-button').click(function(){
//        $("#exampleModalCenter").hide();
    });
        
//    setTimeout("pageRedirect()",10000);
    </script>
   
<body>
<table id="example" class="table table-bordered  table-hover text-nowrap" style="width:100%">
        <thead>
            <tr>
                <th class="text-primary">ID</th>
                <th class="text-primary">Departure Date</th>
                <th class="text-primary">Departure Time</th>
                <th class="text-primary">Arrival Date</th>
                <th class="text-primary">Arrival Time</th>
                <th class="text-primary">From</th>
                <th class="text-primary">To</th>
                <th class="text-primary">Duration</th>
                <th class="text-primary">Price</th>
                <th class="text-primary">Airline</th>
                <th class="text-primary">Total Seat</th>
                <th class="text-primary">ID</th>
        
            </tr>
        </thead>
        <tbody>
            <% 
                Connection con = null;
                Statement statement=null;
                ResultSet set=null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/connection", "root", "system");
                    statement = con.createStatement();
                    
                    set = statement.executeQuery("select * from addflight");
                    while(set.next()) {
            %>
                        <tr>
                            <td><%= set.getInt(1) %></td>
                            <td><%= set.getString(2) %></td>
                            <td><%= set.getString(3) %></td>
                            <td><%= set.getString(4) %></td>
                            <td><%= set.getString(5) %></td>
                            <td><%= set.getString(6) %></td>
                            <td><%= set.getString(7) %></td>
                            <td><%= set.getString(8) %></td>
                            <td><%= set.getInt(9) %></td>
                            <td><%= set.getString(10) %></td>
                            <td><%= set.getInt(11) %></td>
                            <td>
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" >Edit</button>
                            </td>
                            
                        </tr>
            <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
        <tfoot>
            <tr>
                <th>ID</th>
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
        </tfoot>
    </table>
<!--flight view code over-->
    
       
<!--jquery-->
<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>-->

<!-- start of SearchModal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="AdminFlightView" method="post">
              <table>
                  <tr>
                      <td>
                        Enter Flight Id :
                      </td> 
                  
                      <td>
                        <input type="text" class="form-control" name="flight-id" >
                      </td>   
                  </tr>
              </table>
        <div class="modal-footer">    
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="submit-button"  data-toggle="modal" data-target="#exampleModal">Submit</button>
        
      </div>
          </form>
      </div>
    </div>
  </div>
</div>
  <!--End of search modal-->
  
 <!--start of edit module-->
  <!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="edit-button">
  Launch demo modal 2
</button>-->


</body>
</html>

