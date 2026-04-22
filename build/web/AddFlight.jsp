
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="CSS/AddFlight.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
   
</head>

<body class="bb">
    <section>
        <div class="container">
            <div class="formBox">
                <form action="AddFlightServlet" method="POST" id="form-submit">
                    <h1 class="text-center">
                        ADD Flight Details
                    </h1>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="inputbox">
                                <div class="input">Depature</div>
                                <input type="date" name="depature_date" class="form-control">
                                <input type="time" name="depature_time" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox">
                                <div class="inputText">Arrival</div>
                                <input type="date" name="destination_date" class="form-control">
                                <input type="time" name="destination_time" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="inputbox">
                                <div class="inputText">From</div>
                                <select class="select_from" name="Select_from" id="depature_date">
                                    <option selected value="Patna">Patna</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Ranchi">Ranchi</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Ayodhya">Ayodhya</option>
                                    <option value="Bhagalpur">Bhagalpur</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox">
                                <div class="inputText">To</div>
                                <select class="select_to" name="Select_to" id="destination_date">
                                    <option value="Patna">Patna</option>
                                    <option  value="Delhi">Delhi</option>
                                    <option  value="Ranchi">Ranchi</option>
                                    <option value="kolkata">Kolkata</option>
                                    <option value="Ayodhya">Ayodhya</option>
                                    <option value="Bhagalpur">Bhagalpur</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="inputBox">
                                <div class="inputText">Duration <input type="time" name="duration" class="form-control"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputBox">
                                <div class="inputText">Price<input type="text" name="price" class="form-control"></div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                             <div class="inputText">Total Seat
                             <input type="text" name="seat_number" class="form-control">
                                   </div>
                        </div>
                        
                         <div class="col-md-6">
                            <div class="inputbox">
                                <div class="inputText">Select Airline</div>
                                <select class="select_airline" name="Select_airline">
                                    <option value="Airbus">Airbus</option>
                                    <option value="Spicejet">SpiceJet</option>
                                    <option value="Indigo">Indigo</option>
                                </select>
                            </div>    
                    </div>
                    </div>

                    
                       
                     
                 
                   

                    <div class="row mt-3">
<!--             <div class="container text-center" id="loader" style="display:none">
             <span class="fa fa-refresh fa-spin" style="font-size:24px;color:white; display: flex;justify-content: center;"></span>-->
                        <div class="col-md-4">
                            <input type="submit" class="btn btn-primary" value="Register" >
                        </div>
                        <div class="col-md-4">
                            <input type="reset" class="btn btn-secondary" value="Reset">
                        </div>           
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--End of add flight-->-

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.js" integrity="sha512-k1jHgQwcMNMFymeyYv93tJOsIGpceFgh5VDTq2B5pF0pICXBzRGY97vlMobgYA4azK7936iOWkqm/C1vv/PKMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            $(document).ready(function(){
            $("#form-submit").on("submit",function(event){
               event.preventDefault(); 
               var Depature_date=$("#depature_date").val();
               var Destination_date=$("#destination_date").val();
               if(Depature_date===Destination_date){
                   Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Something went wrong"
                    });
                    return;
           }
           let formdata=$("#form-submit").serialize();
           $("#submit-btn").hide();
//           $("#loader").show();
           //over
           
           //Ajax
           $.ajax({
               url: "AddFlightServlet",
               type:"POSt",
               data:formdata,
               success: function(data,txtStatus,jqXHR){
                   $("#submit-btn").show();
//                   $("#loader").hide();
                   if(data.trim()==="done"){
                  Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: false,
                timer: 1500
              });
                   }
                   else{
                       Swal.fire({
                                    icon: "error",
                                    title: "Oops... Connection issue",
                                    text: data

                                }); 
                   }
               },
               error:function(jqXHR, txtStatus, errorThrown){
                      $("#submit-btn").show();
//                              $("#loader").hide();
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
        
</body>

</html>
