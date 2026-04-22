<%-- 
    Document   : Demo
    Created on : 17-Feb-2024, 12:18:37 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.AddFlight" %>
<%@page import="com.web.project.entities.Message" %>
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
        <link href="CSS/bg.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>  
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Paytone+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
    //        $(document).ready(function(){
    ////                $('exampleModal').show();
    //            
    //        });
            $(document).ready(function () {
                function greet() {
    //            $('#hello').hide();
                    $('#exampleModal').modal('show');
                     $('#EditFlight').hide();
                }
                 function showFlightModal() {
            $('#exampleModalCenter').modal('show');
        }
                // greet();
                setTimeout(greet, 3000);
             
                 $('#hello').click(function () {
            // Do something when the modal is closed
               $("#exampleModal").modal('hide');
//            console.log('Modal is closed');
                  });
                  
                  let editflight=false;
                  $('#edit-profile-button').click(function(){
                       if(editflight===false){
                         $('#flight-view').hide();
                       $('#EditFlight').show();
                       editflight=true;
                       $(this).text("Back");
                       }
                       else{
                           $("#flight-view").show();
                           $("#EditFlight").hide();
                           editflight=false;
                           $(this).text("Edit");
                       }
                  });
                   $("#btn-add").click(function () {
            // Call the function to show the flight modal
            showFlightModal();
        });
            });



        </script>
        <style>
            <style>
        .hero {
            position: relative;
        }
        .glow-on-hover {
             font-size: 20px;
            /* border-radius: 6px; */
            border: 2px black;
            background-color: aqua; 
            position: absolute;
            top: 10px; /* Adjust as needed */
            right: 10px; /* Adjust as needed */
            z-index: 1; /* Ensure button is on top */
        }
        .glow-on-hover {
    width: 150px;
    height: 30px;
    border: none;
    outline: none;
    color: #fff;
    background: #111;
    cursor: pointer;
    /* position: relative; */
    z-index: 0;
    border-radius: 10px;
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left:-2px;
    background-size: 200%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #000;
}

.glow-on-hover:active:after {
    background: transparent;
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: #111;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% { background-position: 0 0; }
    50% { background-position: 400% 0; }
    100% { background-position: 0 0; }
}
#btn-save{
    border-left-width: 11px;
    padding-left: 6px;
    margin-left: 194px;
}

        </style>
    </head>
    <body>
        <div class="hero">
            <h1>Welcome to AirBus</h1>
            <button class="glow-on-hover" type="button" id="btn-add">Click To View</button>  
            <video autoplay muted loop class="video-bg">
                <source src="IMG/bg2.mp4" type="video/mp4">

            </video>
        </div>




<!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >
            Launch demo modal
        </button>-->


        <!-- Edit Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:steelblue">
                        <h5 class="modal-title" id="exampleModalLabel" >Air Bus</h5>
                      
                    </div>
                    <div class="modal-body" id="flight-view">      
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%=add.getid()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">FROM :</th>
                                    <td><%=add.getFrom()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">TO :</th>
                                    <td><%=add.getTo()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Airline :</th>
                                    <td><%=add.getSelect_airline()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Depature Date :</th>
                                    <td><%=add.getDepaturedate()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Depature time :</th>
                                    <td><%=add.getDepaturetime()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Arrival time :</th>
                                    <td><%=add.getArrivaltime()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Total Seat :</th>
                                    <td><%=add.getSeatno()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Price :</th>
                                    <td><%=add.getprice()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
          
                  
                  <div id="EditFlight" style=display="none" >
                   <h2 class="mt-2" style="text-align:center">Flight Edit</h2>
                <form action="UpdateFlightServlet" method="post" enctype="multipart/form-data">
                                        <table class="table">
                                            <tbody>
                                <tr>
                                    <td>ID :</td>
                                    <td><%=add.getid()%></td>
                                </tr>
                                <tr>
                                    <td>FROM :</td>
                                    <td><input type="text" class="form-control" name="flight_from" value="<%=add.getFrom()%>"></td>
                                </tr>
                                <tr>
                                    <td>TO :</td>
                                   
                                    <td><input type="text" class="form-control" name="flight_to" value="<%=add.getTo()%>"></td>
                                </tr>
                                <tr>
                                    <td >Airline :</td>
                             
                                      <td><input type="text" class="form-control" name="flight_airline" value="<%=add.getSelect_airline()%>"></td>
                                   
                                </td>
                                <tr>
                                    <td>Depature Date :</td>
                                    <td><input type="date" class="form-control" name="flight_depaturedate" value="<%=add.getDepaturedate()%>"></td>
                                </tr>
                                <tr>
                                    <td>Depature time :</td>
                                   <td><input type="date" class="form-control" name="flight_depaturetime" value="<%=add.getDepaturetime()%>"></td>  
                                </tr>
                                <tr>
                                    <td>Arrival time :</td>
                                  <td><input type="text" class="form-control" name="flight_airlinetime" value="<%=add.getArrivaltime()%>"></td>
                                </tr>
                                <tr>
                                    <td>Total Seat :</td>
                   
                                      <td><input type="number" class="form-control" name="flight_seatno" value="<%=add.getSeatno()%>"></td>
                                </tr>
                                <tr>
                                    <td>Price :</td>
                           <td><input type="number" class="form-control" name="flight_price" value="<%=add.getprice()%>"></td>
                                </tr>
                            </tbody>
                         </table> 
                 <button type="submit" class="btn btn-primary" id="btn-save"> save</button>
                                     <%
           Message r=(Message)session.getAttribute("msge");
           if(r!=null){//session null value nhi aaye to iska mtlb message hoga
           %>
           <div class="alert <%=r.getcssclass()%>" role="alert" >
                      <%=r.getcontent()%>
              </div>   
            
            <%
                session.removeAttribute("msge");
                        }
                %>
                </form>        
              </div>            
          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="hello">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit</button>
      </div>
       
          </div>
            </div>
        </div>                      
    </body>
</html>

