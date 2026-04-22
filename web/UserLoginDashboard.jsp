
<%@page import="com.web.project.entities.User"%>
<%--<%@page import="com.web.project.entities.AddFlight"%>--%>
<%@page import="com.web.project.entities.Message" %>
<%@page errorPage="Error_page.jsp"%>
<%
    User user=(User)session.getAttribute("currentUser"); //sesssion ka attribute ma  passkiya hua key sa value then cast to user type class
    if(user==null){
        response.sendRedirect("signin.jsp");
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
          .center {
  display: block;
  margin-top:-30px;
  margin-left: auto;
  margin-right: auto;
  width: 200px;
height:200px;
}
        </style>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <link rel="icon" href="IMG/logo.png">
      <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Paytone+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <!--my profile-->
  <script>
      $(document).ready(function(){ 
//          alert("button clicked");
//          $("#profile-details").hide();
//          $("#profile-edit").show();
          let editstatus=false;
         $('#edit-profile-button').click(function(){
         if(editstatus===false){
           $("#profile-details").hide(); 
          $("#profile-edit").show();
          editstatus=true;
          $(this).text("Back");
         }
         else{
           $("#profile-details").show(); 
          $("#profile-edit").hide();
          editstatus=false;
          $(this).text("Edit");
         }
          });
      });
      </script>
      
       <!--Edit post saved js-->
      <script>

            $(document).ready(function () {
                $("#submit-form").on("submit", function (event) {
                    event.preventDefault();
                    let formdata = $("#submit-form").serialize();

                    //ajax
                    $.ajax({
                        url: "AdminSevlet",
                        type: "POST",
                        data: formdata,
                        success: function (data, txtStatus, jqxHR) {
                            console.log(data);
                            if (data.trim() === "success") {
                                Swal.fire({
                                    title: 'Login Successfull',
                                    text: "Press YES For Redirecting Admin dashboard",
                                    icon: 'success',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'Yes'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location = "UserDashboard.jsp";
                                    }
                                });
                            } else {
                                Swal.fire({
                                    icon: "error",
                                    title: "Oops...",
                                    text: data

                                });
                            }
                        },
                        error: function (jqXHR, txtStatus, errorThrown) {
                            Swal.fire({
                                icon: "error",
                                title: "Oops...",
                                text: "Something went wrong!"

                            });
                        }
                    });
                });

            });

        </script>
    </head>
<body>
<!--<nav class="navbar navbar-inverse">
  <div class="navbar navbar-dark bg-primary">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">AirBus</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="UserLoginDashboard.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="FlightUserView.jsp">Search Flight</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="#!" ><span class="glyphicon glyphicon-user" data-toggle="modal" data-target="#exampleModal" style="color: white">&nbsp;<%=user.getName()%></span></a></li>
      <li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logouts</a></li>
    </ul>
  </div>
</nav>-->
<!--        </div>   
            
             
                
             <!--body-->
             
<!-- Background Video & Header -->

    <div class="banner">
        <video src="IMG/bgvid.mp4" type="video/mp4" autoplay muted loop></video>
    
    <!-- Header -->

    <div class="content" id="home"> 
         <nav>
            <img src="IMG/logo.png" class="logo" alt="Logo" title="FirstFlight Travels">
            
            <ul class="navbar">
                <li>
                    <a href="Home.jsp">Home</a>
                    <a href="#locations">Locations</a>
                    <a href="FlightUserView.jsp">search</a>
<!--                    <a href="about.html">About Us</a>
                    <a href="about.html">Contact Us</a>-->
       <a href="#!" ><span class="glyphicon glyphicon-user" data-toggle="modal" data-target="#exampleModal">&nbsp;<%=user.getName()%></span></a>
      <a href="LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logouts</a>
                </li>
            </ul>
        </nav> 
<!--        <nav class="navbar navbar-inverse">
  <div class="navbar navbar-dark bg-primary">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">AirBus</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="UserLoginDashboard.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="FlightUserView.jsp">Search Flight</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="#!" ><span class="glyphicon glyphicon-user" data-toggle="modal" data-target="#exampleModal" style="color: white">&nbsp;<%=user.getName()%></span></a></li>
      <li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logouts</a></li>
    </ul>
  </div>
</nav>-->
        <div class="title">
            <h1>FIRSTFLIGHT TRAVELS</h1>
            <p>Plan your trip with us and travel around the world with the most affordable packages!</p>
            <!--<a href="register.html" class="button">Register Now!</a>-->
            <a href="TicketBooking.jsp" class="button">Book  Now!</a>

        </div>
        </div>
    </div>

<!-- Services -->

<section class="container">
    <div class="text">
        <h2>We have the best services available for you!</h2>
    </div>
    <div class="rowitems">
        <div class="container-box">
        <div class="container-image">
           <img src="IMG/1a.jpg" alt="Flight Services">
        </div>
            <h4>Flight Services</h4>
            <p>Arrival and Departure</p>
        </div>
    
        <div class="container-box">
        <div class="container-image">
           <img src="IMG/2a.jpg" alt="Food Services">
        </div>
            <h4>Food Services</h4>
            <p>Catering</p>
        </div>

        <div class="container-box">
        <div class="container-image">
            <img src="IMG/3a.jpg" alt="Travel Services">
        </div>
            <h4>Travel Services</h4>
            <p>Pick-up/drop</p>
        </div>

        <div class="container-box">
        <div class="container-image">
            <img src="IMG/4a.jpg" alt="Hotel Services">
        </div>
            <h4>Hotel Services</h4>
            <p>Check-in/out</p>
        </div>

    </div>

    </div>

</section>

<!-- Locations -->

<section class="locations" id="locations">
    <div class="package-title">
        <h2>Locations</h2>
    </div>

    <div class="location-content">
        
        <a href="locations.html#kashmir" target="_blank"><div class="col-content">
            <img src="IMG/l1.jpg" alt="">
            <h5>India</h5>
            <p>Kashmir</p>
        </div></a>

       

        <a href="locations.html#istanbul" target="_blank"><div class="col-content">
            <img src="IMG/l2.jpg" alt="">
            <h5>Turkey</h5>
            <p>Istanbul</p>
        </div></a>

        <a href="locations.html#paris" target="_blank"><div class="col-content">
            <img src="IMG/l3.jpg" alt="">
            <h5>France</h5>
            <p>Paris</p>
        </div></a>

        <a href="locations.html#bali" target="_blank"><div class="col-content">
            <img src="IMG/l4.jpg" alt="">
            <h5>Indonesia</h5>
            <p>Bali</p>
        </div></a>

        <a href="locations.html#dubai" target="_blank"><div class="col-content">
            <img src="IMG/l5.jpg" alt="">
            <h5>United Arab Emirates</h5>
            <p>Dubai</p>
        </div></a>

        <a href="./locations.html#geneva" target="_blank"><div class="col-content">
            <img src="IMG/l6.jpg" alt="">
            <h5>Switzerland</h5>
            <p>Geneva</p>
        </div></a>

        <a href="locations.html#port-blair" target="_blank"><div class="col-content">
            <img src="IMG/l7.jpg" alt="">
            <h5>Andaman & Nicobar</h5>
            <p>Port Blair</p>
        </div></a>

        <a href="locations.html#rome" target="_blank"><div class="col-content">
            <img src="IMG/l8.jpg" alt="">
            <h5>Italy</h5>
            <p>Rome</p>
        </div></a>

    </div>
</section>

<!-- Packages -->

<section class="package" id="package">
    <div class="package-title">
        <h2>Packages</h2>
    </div>

    <div class="package-content">
        
        <div class="box">
            <div class="image">
                <img src="IMG/p1.jpg" alt="">
                <h3>Rs.9,999/-</h3>
            </div>
        
        <div class="dest-content">
            <div class="location">
                <h4>Bronze</h4>
                <ul class="pac-details">
                    <li>2 Star Hotel</li>
                    <li>5 Nights Stay</li>
                    <li>Free photo Session</li>
                    <li>Friendly Tour Guide</li>
                    <li>24/7 Customer Help Center</li>
                </ul>
            </div>
        </div>
        </div>
        
        <div class="box">
            <div class="image">
                <img src="IMG/p2.jpg" alt="">
                <h3>Rs.19,999/-</h3>
            </div>
        
        <div class="dest-content">
            <div class="location">
                <h4>Silver</h4>
                <ul class="pac-details">
                    <li>3 Star Hotel</li>
                    <li>7 Nights Stay</li>
                    <li>Free photo Session</li>
                    <li>Friendly Tour Guide</li>
                    <li>24/7 Customer Help Center</li>
                </ul>
            </div>
        </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="IMG/p3.jpg" alt="">
                <h3>Rs.29,999/-</h3>
            </div>
        
        <div class="dest-content">
            <div class="location">
                <h4>Gold</h4>
                <ul class="pac-details">
                    <li>4 Star Hotel</li>
                    <li>10 Nights Stay</li>
                    <li>Breakfast and Dinner</li>
                    <li>Free photo Session</li>
                    <li>Friendly Tour Guide</li>
                    <li>24/7 Customer Help Center</li>
                </ul>
            </div>
        </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="IMG/p4.jpg" alt="">
                <h3>Rs.39,999/-</h3>
            </div>
        
        <div class="dest-content">
            <div class="location">
                <h4>Platinum</h4>
                <ul class="pac-details">
                    <li>5 Star Hotel</li>
                    <li>14 Nights Stay</li>
                    <li>Breakfast, Lunch and Dinner</li>
                    <li>Bornfire</li>
                    <li>Free photo Session</li>
                    <li>Friendly Tour Guide</li>
                    <li>24/7 Customer Help Center</li>
                </ul>
            </div>
        </div>
        </div>

    </div>

</section>

<!-- Newsletter -->

<section class="newsletter">
    <div class="newstext">
        <h2>Newsletter</h2>
        <p>Subscribe to get offers and latest<br>updates every week!</p>
    </div>

    <div class="send">
        <form action="">
            <input type="email" name="emailid" placeholder="E-mail" required>
            <input type="submit" value="Subscribe">
        </form>
    </div>

</section>

<!-- Footer -->

<section class="footer">
    <div class="foot">
        <div class="footer-content">
            
            <div class="footlinks">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="register.html">Register</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </div>

            <div class="footlinks">
                <h4>Connect</h4>
                <div class="social">
                    <a href="https://www.facebook.com/mohd.rahil.blogger" target="_blank"><i class='bx bxl-facebook'></i></a>
                    <a href="https://www.instagram.com/mohdrahil101" target="_blank"><i class='bx bxl-instagram' ></i></a>
                    <a href="https://www.twitter.com/mohdrahil101" target="_blank"><i class='bx bxl-twitter' ></i></a>
                    <a href="https://www.linkedin.com/in/mohdrahil101" target="_blank"><i class='bx bxl-linkedin' ></i></a>
                    <a href="https://www.youtube.com/techdollarz" target="_blank"><i class='bx bxl-youtube' ></i></a>
                    <a href="https://www.mohdrahil.wordpress.com" target="_blank"><i class='bx bxl-wordpress' ></i></a>
                    <a href="https://www.github.com/mohdrahil101" target="_blank"><i class='bx bxl-github'></i></a>
                </div>
            </div>
            
        </div>
    </div>

    <div class="end">
        <p>Copyright © 2022 Firstflight Travels All Rights Reserved.<br>Website developed by: Mohd. Rahil</p>
    </div>
</section>

 <!--end body-->
<!--<div class="container">
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>-->
      
 <!--end of UerLoginDashboard-->
 
<!--profile model-->

<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#0080FF;color:white;">
          <h3 class="modal-title" id="exampleModalLabel" style="text-align: center">AIR BUS</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span><!--
        </button>-->
      </div>
      <div class="modal-body">
          <div>
              
          </div>
        <img src="profilePic/<%=user.getProfile()%>" class="center" style="border-radius:50%; object-fit: cover" alt=""/> </h4>
       <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">
           <!--details-->
           <div id="profile-details">
       <table class="table">
<!--  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
    </tr>
  </thead>-->
  <tbody>
       <tr>
      <!--<th scope="row">1</th>-->
      <td>  <%=user.getName()%></td>  
    </tr>
    <tr>
      <!--<th scope="row">1</th>-->
      <td>Id  : <%=user.getId()%></td>  
    </tr>
    
    <tr>
      <!--<th scope="row">2</th>-->
      <td >Username  : <%=user.getUsername()%></td>
    
    </tr>
    <tr>
<!--      <th scope="row">3</th>-->
      <td colospan="2" >Email  : <%=user.getEmail()%></td>
    </tr>
      <tr>
      <tr>
          <td >Mobile no: <%=user.getPhoneno()%></td>
              
          </td>
      </tr>
<!--      <th scope="row">3</th>-->
      <td colospan="2" >Register on  : <%=user.getR_datetime()%></td>
    </tr>
  </tbody>
</table>
           </div>

    <!-- profile Edit-->
    <div id="profile-edit" style="display:none">
        <h2 class="mt-2">Profile Edit</h2>
        <!--action="EditServlet" method="post"-->
        <form  id="submit-for" action="EditServlet" method="post" enctype="multipart/form-data">
            <table class="table">
                <tr>
                    <td>ID :</td>
                    <td><%=user.getId()%></td>
                </tr>
                  <tr>
                    <td>Email :</td>
                    <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                </tr>
                 <tr>
                    <td>Username :</td>
                    <td><input type="text" class="form-control" name="user_username" value="<%=user.getUsername()%>"></td>
                </tr>
                  <tr>
                    <td>Mobile no :</td>
                    <td><input type="text" class="form-control" name="user_phoneno" value="<%=user.getPhoneno()%>"></td>
                </tr>
                 <tr>
                    <td>Select New Profile  :</td>
                    <td><input type="file" class="form-control" name="user_profilepic" ></td>
                </tr>
            </table>
                <button type="submit" class="btn btn-primary">save</button>
           <%
           Message f=(Message)session.getAttribute("msg");
           if(f!=null){//session null value nhi aaye to iska mtlb message hoga
           %>
           <div class="alert <%=f.getcssclass()%>" role="alert" >
                      <%=f.getcontent()%>
              </div>   
            
            <%
                
                session.removeAttribute("msg");
                        }
              %> 
        </form>
    </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit</button>
      </div>
                      
    </div>
  </div>
</div>
     
        <!--jquery code-->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.js" integrity="sha512-k1jHgQwcMNMFymeyYv93tJOsIGpceFgh5VDTq2B5pF0pICXBzRGY97vlMobgYA4azK7936iOWkqm/C1vv/PKMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
<!--// end of profile model-->
    
    <!--<br>-->
    <%--<%= user.getUsername()%>--%>
    <!--<br>-->
    <%--<%=user.getEmail()%>--%>
    <!--<br>-->
    <%--<%=user.getName()%>--%>
<!--    <br>-->

    <%--<%=user.getName()%>--%>
       <%--<%=user.getName()%>--%>

    </body>
</html>
