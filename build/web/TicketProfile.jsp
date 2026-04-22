<%-- 
    Document   : TicketProfile
    Created on : 06-Mar-2024, 8:04:11 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Flight Search</title>

    <link rel="icon" href="https://www-turkishairlines.akamaized.net/theme/img/icons/favicon.ico">

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
        integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body
    style="background: -webkit-radial-gradient(rgb(136, 15, 159), rgb(6, 19, 31));  background: radial-gradient(rgb(136, 15, 159), rgb(6, 19, 31)); background:url('./assets/img/main.jpg');">


    <!-- Top content -->
    <div class="top-content">
        <div class="inner-bg" style="padding:0px 0px 80px 0;">
            <div class="container">
                <div class="row justify-content-center">

                    <div class="col-md-6 offset-md-3">
                        <div class="form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3 style="color:white;">Complete the Following</h3>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-plane"></i>
                                </div>
                            </div>
                            <div class="form-bottom" style="color:white;">
                                <form role="form"   action="TicketProfileDisplay2.jsp" method="post" class="flight-booking-form" >

                                    <div class="row">
                                        <div class="form-group col-lg-6">
                                            <label for="name">Name</label>
                                            <input required type="text" name="name" placeholder="Your Name..."
                                                class="form-control">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="email">Email</label>
                                            <input required type="email" name="email" placeholder="Your Email..."
                                                class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-lg-6">
                                            <label for="phone">Phone Number</label>
                                            <input required type="tel" name="phone"
                                                placeholder="Your Phone Number..." class="form-control">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="address">Address</label>
                                            <input type="text" name="address" required placeholder="Your Address..."
                                                class="form-control">
                                        </div>
                                    </div>
                                    <div style="text-align:center;">
                                        <button style="margin-top:5%;" type="submit"
                                            class="btn col-xs-5 col-md-5" id="submitBtn" >Book Flight</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>

<!--profile modal-->
<div class="btn-search">
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">-->
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
    <form  action="BookingServlet" method="post" id="my">
        <div class="form">
            <h3 style="text-align: center;"> ENTER FLIGHT ID</h3>
        </div>
        <input class="data" type="text" placeholder="Enter Flight Id" name="flight-id">
        
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
<!--over profile modal-->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
        $(document).ready(function () {
//            $("#submitBtn").click(function () {
             $("#submitBtn").click(function () {
            $('#exampleModalCenter').modal('show');
            window.location.href="ProfileDisplay.jsp";
        });
//                $('#exampleModalCenter').modal('show');
//                var name = $("input[name='name']").val();
//                var email = $("input[name='email']").val();
//                var phone = $("input[name='phone']").val();
//                var address = $("input[name='address']").val();
//
//                if (name !== '' && email !== '' && phone !== '' && address !== '') {
////                    $('#exampleModalCenter').modal('show');
//                } else {
////                    alert('Please fill all fields.');
//                     $('#exampleModalCenter').modal('show');
//                }
//            });
        });
    </script>
</body>
