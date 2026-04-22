<%-- 
    Document   : payment
    Created on : 10-Mar-2024, 9:51:01 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.User" %>
<%@page import="com.web.project.entities.AddFlight" %>
<%@page import="com.web.project.entities.Message" %>
<%@page import="com.web.project.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error_page.jsp"%>
<%
    User pay=(User)session.getAttribute("payment");
    if(pay==null){
     response.sendRedirect("Error_page.jsp");
    }
%>
<%
    User m=(User)session.getAttribute("currentUser");
    if(m==null){
     response.sendRedirect("Error_page.jsp");
    }
%>
<%
    AddFlight flight=(AddFlight)session.getAttribute("booking");
    if(flight==null){
     response.sendRedirect("Ticket.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Student Profile Page Design Example</title>

    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
    
    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="CSS/TicketProfileDisplay.css" />
    
    <link rel="stylesheet" href="CSS/TicketProfileDisplay22.css">
    <style>
        video {
            max-width:100%;
            height: 100%;
        }
        

        /* Responsive styles */
        @media screen and (max-width: 768px) {
            .col-lg-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
            .col-lg-8 {
                flex: 0 0 100%;
                max-width: 100%;
            }
             
        }
    </style>
</head>
<body style="background-color:black;  background: url('./assets/img/dashboard.jpg'); background-size:cover;">      
<header class="ScriptHeader">
    <div class="rt-container">
        <div class="col-rt-12">
            <!-- <div class="rt-heading">
              <h1>Student Profile Page Design Example</h1>
              <p>A responsive student profile page design.</p>
            </div> -->
        </div>
    </div>
</header>
<section>
    <div class="rt-container">
        <div class="col-rt-12">
            <div class="Scriptcontent">              
                <!-- Student Profile -->
                <div class="student-profile py-4">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card shadow-sm">
                                     <form action="Payment" method="post">
                                    <div class="card-header bg-transparent text-center">
                                      <!-- <img class="profile_img" src="https://source.unsplash.com/600x300/?student" alt="student dp"> -->
                                   <img class="profile_img" src="IMG/scanner.jpeg" alt="student dp"> 
                                        <h3> Scan here  for payment</h3>
                                    </div>
                                    <div class="card-body">
                          
                                        <!-- <p class="mb-0"><strong class="pr-1">Student ID:</strong>321000001</p>
                                        <p class="mb-0"><strong class="pr-1">Class:</strong>4</p>
                                        <p class="mb-0"><strong class="pr-1">Section:</strong>A</p> -->
                                        <p class="mb-0"> Enter Trancation number</p>
                                        <input  class="mb-0" type="text" name="transcation" value="" required>
                                                      <%
                                            String address=pay.getaddress();
                                            String transcation=request.getParameter("transcation");
                                            String name=m.getName();
                                            String username=m.getUsername();
                                            int userid=m.getId();
                                            int flightid=flight.getid();
                                            String flightname=flight.getSelect_airline();
//                                            out.print(name);
//                                            out.println(transcation);
//                                            out.println(flightname);
//                                            out.println("flightid"+flightid);
                                            %>
         <input type="hidden" name="name" value="<%=name%>">
         <input type="hidden" name="username" value="<%=username%>">
         <input type="hidden" name="registrationid" value="<%=userid%>">
         <input type="hidden" name="address" value="<%=address%>">   
         <input type="hidden" name="flightid" value="<%=flightid%>">
         <input type="hidden" name="flightname" value="<%=flightname%>">
                                  </div>                                   
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent border-0">
                                    <!-- <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3> -->
                                </div>
                                <div class="card-body pt-0">
                                
                                    <table class="table table-bordered">
                                        <!-- <tr>
                                            <th width="30%">Roll</th>
                                            <td width="2%">:</td>
                                            <td>125</td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Academic Year	</th>
                                            <td width="2%">:</td>
                                          <td>2020</td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Gender</th>
                                            <td width="2%">:</td>
                                            <td>Male</td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Religion</th>
                                            <td width="2%">:</td>
                                            <td>Group</td>
                                        </tr>
                                        <tr>
                                            <th width="30%">blood</th>
                                            <td width="2%">:</td>
                                            <td>B+</td>
                                        </tr> -->
                                      <video src="IMG/bb.mp4" autoplay loop muted></video>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn">
                        <button type="submit" class="btn-primary">submit</button>
                        </div>
                       </form>
                </div>
                <!-- partial -->     
            </div>
        </div>
    </div>
</section>
    <!-- Analytics -->
</body>
</html>

