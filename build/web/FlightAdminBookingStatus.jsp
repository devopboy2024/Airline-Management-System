<%-- 
    Document   : FlightAdminBookingStatus
    Created on : 13-Mar-2024, 10:07:05 am
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
<table id="example" class="table  table-brown table-bordered  table-hover text-nowrap" style="width:100%">
        <thead>
      
 <tr>
            <th class="text-primary">id</th>
           <th class="text-primary">Username</th>
          <th class="text-primary">Email</th>
            <!--<th class="text-primary">Mobile</th>-->
              <!--<th class="text-primary" >Address</th>-->
               <th class="text-primary">F-name</th>
                  <th class="text-primary">F-class</th>
                  <th class="text-primary">F-id</th>
                  <!--<th class="text-primary">From</th>-->
                   <!--<th class="text-primary">TO</th>-->
                    <th class="text-primary">Depature Date</th>
                    <!--<th class="text-primary">Depature time</th>-->
                    <th class="text-primary">Arrival time</th>
                    <!--<th class="text-primary">money </th>-->
                    <th class="text-primary">Status</th>
                    <th class="text-primary" >#</th>
                    <th class="text-primary" >#</th>
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
                    
                    set = statement.executeQuery("select * from flightprofile");
                    while(set.next()) {
            %>
                        <tr>
                      <td><%=set.getString(1)%></td>
                    <td><%=set.getString(2)%></td>
                    <td><%= set.getString(3) %></td>
                    
                    
                    <td><%= set.getString(6) %></td>
                    <td><%= set.getString(7) %></td>
                    <td><%= set.getString(8) %></td>

                    
                    <td><%= set.getString(11) %></td>
                    
                    <td><%= set.getString(13) %></td>
                    
                   <td><%= set.getString(17) %></td>
                            <td>
                                <!--<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" >Edit</button>-->
                                <a data-toggle="modal" data-target="#exampleModalCenter" ><img src="IMG/check-mark.png" style="height: 35px;width: 35px"></a>
                            </td>
                            <td>
                                <!--<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" >Edit</button>-->
                                <a data-toggle="modal" data-target="#exampleModalCenterr" ><img src="IMG/delete.png" style="height: 35px;width: 35px"></a>
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

<!-- start of SearchModal 1 -->
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
          <form action="AdminFlightconform" method="post">
              <table>
                  <tr>
                      <td>
                        Enter  Id : 
                      </td>
                      <td>
                      <input type="text" class="form-control" name="flight-id" >
                      </td>
                  </tr>
                  <tr>
                        <td>
                          Booking name:                      
                        </td>  
                        <td>
                          <input type="text" class="form-control" name="uname" >

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
  <!--End of search modal 1-->
  
  <!--Start of search modal 2-->
  <div class="modal fade" id="exampleModalCenterr" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!--action="FlightDelete" method="post"-->
          <form  action="FlightDelete" method="post" >
              <table>
                  <tr>
                      <td>
                        Enter  Id : 
                      </td>
                      <td>
                      <input type="text" class="form-control" name="flight-id" >
                      </td>
                  </tr>
                  <tr>
                        <td>
                           Booking name:                      
                        </td>  
                        <td>
                          <input type="text" class="form-control" name="uname" >

                        </td>
                  </tr>
              </table>
        <div class="modal-footer">    
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="submit-delete"  data-toggle="modal" data-target="#exampleModal">Submit</button>
        
      </div>
          </form>
      </div>
    </div>
  </div>
</div>
 <!--End of search module 2-->
  <!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="edit-button">
  Launch demo modal 2
</button>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
//$(document).ready(function () {
//            $("#submit-delete").on("submit", function (event) {
//                event.preventDefault();
//                let formdata = $(this).serialize();

                // AJAX request
//                $.ajax({
//                    url: "FlightDelete",
//                    type: "POST",
//                    data: formdata,
//                    success: function (data) {
//                        console.log(data);
//                        if (data.trim() === "success") {
//                            // If deletion is successful, show success message
//                            Swal.fire({
//                                title: 'Nice Job',
//                                text: "Successfully Deleted",
//                                icon: 'success'
                                
                                // Uncomment below for confirmation dialog with redirect
                                /*
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location = "UserDashboard.jsp";
                                    }
                                */
                               
//                            });
//                        } else {
//                            // If deletion fails, show error message
//                            Swal.fire({
//                                icon: "error",
//                                title: "Oops...",
//                                text: "Something Went Wrong"
//                            });
//                        }
//                    },
//                    error: function () {
//                        // If AJAX request fails, show error message
//                        Swal.fire({
//                            icon: "error",
//                            title: "Oops...",
//                            text: "Something went wrong!"
//                        });
//                    }
//                });
//            });
//        });
</script>
</body>
</html>

