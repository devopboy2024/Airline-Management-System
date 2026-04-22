<%-- 
    Document   : TicketProfileDisplay2
    Created on : 07-Mar-2024, 9:16:34 pm
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
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Flight Profile Details</title>

    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
     <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

    <!--Only for demo purpose - no need to add.-->
    <link href="CSS/TicketProfileDisplay2.css" rel="stylesheet" type="text/css"/>
      <link href="CSS/TicketProfileDisplay.css" rel="stylesheet" type="text/css"/>
</head>
<style>
 #btn-submit{
        margin-top: 20px;
     display: flex;
    justify-content: center;
    align-items: center;
    /*margin-bottom: 400px;*/
    }

    </style>
<body>
	            <%
                     int money;   
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String address=request.getParameter("address");
            String flightclass=flight.getFlightclass();
            int price=flight.getprice();
//            out.print("<h2>name: "+name+"</h2>");
            if(flightclass.equals("Economy")){
//              out.print("<h2>Flightclass: "+flightclass+"</h2>");
               money=(70*price)/100;
//              out.print(money);
            }
            if(flightclass.equals("Business")){
//              out.print("<h2>Flightclass: "+flightclass+"</h2>");
               money=(80*price)/100;
//              out.print(money);
            }
            else{
//            out.print("<h2>Flightclass: "+flightclass+"</h2>");
             money=(100*price)/100;
//              out.print(money);
            }
            %>	
<div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
 
            <!-- Ad Here -->
            
        </div>
        <div class="col-rt-2">
            <ul>
                <li><a href="TicketProfile.jsp" title="Back to tutorial page">Back</a></li>
            </ul>
        </div>
    </div>
</div>

<header class="ScriptHeader">
    <div class="rt-container">
    	<div class="col-rt-12">
        	<div class="rt-heading">
            	<h1 style="text-align:center">Flight Profile Details</h1>
                <!--<p>A responsive student profile page design.</p>-->
            </div>
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
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="IMG/profiledisplay.png" alt="student dp">
            <h3><%=name %></h3>
          </div>
          <div class="card-body">
            <!--<p class="mb-0"><strong class="pr-1">Name :</strong>name</p>-->
            <p class="mb-0"><strong class="pr-1">Mobile no:</strong><%=phone%></p>
            <p class="mb-0"><strong class="pr-1">Email:</strong><%=email%></p>
            <p class="mb-0"><strong class="pr-1">ADDRESS:</strong><%=address%></p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
         <div class="card shadow-sm">
        <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Flight Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Flight ID</th>
                <td width="2%">:</td>
                <td><%=flight.getid()%></td>
              </tr>
              <tr>
                <th width="30%">From	</th>
                <td width="2%">:</td>
                <td><%=flight.getFrom()%></td>
              </tr>
              <tr>
                <th width="30%">To</th>
                <td width="2%">:</td>
                <td><%=flight.getTo()%></td>
              </tr>
              <tr>
                <th width="30%">Airline</th>
                <td width="2%">:</td>
                <td><%=flight.getSelect_airline() %></td>
              </tr>
              <tr>
                <th width="30%">Depature Date</th>
                <td width="2%">:</td>
                <td><%=flight.getDepaturedate() %></td>
              </tr>
                <tr>
                <th width="30%">Depature Time</th>
                <td width="2%">:</td>
                <td><%=flight.getDepaturetime() %></td>
              </tr>
              <tr>
                <th width="30%">price</th>
                <td width="2%">:</td>
                <td><%=money%></td>
              </tr>
              <tr>
                <th width="30%">flightclass</th>
                <td width="2%">:</td>
                <td><%=flightclass%></td>
              </tr>
              <tr>
                <th width="30%">Total Seat</th>
                <td width="2%">:</td>
                <td><%=flight.getSeatno()%></td>
              </tr>
              <tr>
                <th width="30%">Arrival Time</th>
                <td width="2%">:</td>
                <td><%=flight.getArrivaltime()%></td>
              </tr>
            </table> 
          </div>  
        </div>
              <form action="TicketProfileDisplay" method="post">
         <input type="hidden" name="id" value="<%=flight.getid()%>">
         <input type="hidden" name="from" value="<%=flight.getFrom()%>">
        <input type="hidden" name="to" value="<%=flight.getTo()%>">
        <input type="hidden" name="airline" value="<%=flight.getSelect_airline() %>">
        <input type="hidden" name="depaturedate" value="<%=flight.getDepaturedate() %>">
        <input type="hidden" name="depaturetime" value="<%=flight.getDepaturetime() %>">
        <input type="hidden" name="money" value="<%=money%>">
        <input type="hidden" name="flight-class" value="<%= flightclass %>">
        <input type="hidden" name="seatno" value="<%=flight.getSeatno()%>">
        <input type="hidden" name="arrivaltime" value="<%=flight.getArrivaltime()%>">
        <input type="hidden" name="name" value="<%=name%>">
        <input type="hidden" name="email" value="<%=email%>">
        <input type="hidden" name="phone" value="<%=phone%>">
        <input type="hidden" name="address" value="<%=address%>">
              <div class="btn-submit">
               <button type="submit" class="btn btn-primary" id="btn-submit">Submit</button>
              </div>
              </form>
<!--          <div style="height: 26px"></div>
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Other Information</h3>
          </div>
          <div class="card-body pt-0">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          </div>
        </div>-->
      </div>
    </div>
  </div>
</div>
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>
     


    <!-- Analytics -->

	</body>
</html>