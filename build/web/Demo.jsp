<%-- 
    Document   : Demo
    Created on : 17-Feb-2024, 12:18:37 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.AddFlight" %>
<%@page import="com.web.project.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error_page.jsp"%>
<%
    AddFlight add=(AddFlight)session.getAttribute("flight");
    if(add==null){
     response.sendRedirect("Error_page.jsp");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>   
    <script>
        $(document).ready(function(){
            
        });
        </script>
    </head>
    <body>
        
<table id="example" class="table table-striped" style="width:100%">
        <thead>
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
                <th> </th>
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
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">Edit</button>
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
        
        
        <h1>Hello World!</h1>
        <h1><%=add.getDepaturetime()%></h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="button">
  Launch demo modal
</button>


<!-- Edit Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
   <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <%--<%=add.getDepaturetime()%>--%>
                  <h1><%=add.getDepaturetime()%></h1>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
         </body>
</html>
