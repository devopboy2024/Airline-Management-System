

<html>
    <head>
        <title>TODO supply a title</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="CSS/signup.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="title" ><u>Registration form</u></div> <!-- Corrected the closing div tag here -->

            <form action="RegisterServlet" method="POST" name="form" id="reg-form">
                <div class="user-details">
                    <div class="input-details">
                        <a href="signin.html"></a>
                        <span  style="--clr:#1e9bff"  class="details">Full Name</span>
                        <input  class="a1" type="text" name="txtname" pattern="[A-Za-z\s]{2,}" title="Please enter a valid name (at least 2 characters long, letters only)" placeholder="Enter Your Name" required >
                    </div>

                    <div class="input-details">
                        <span   style="--clr:#1e9bff" class="details">Username</span>
                        <input  class= "a1" type="text" name="txtusername" placeholder="Enter Your username" required>
                    </div>

                    <div class="input-details">
                        <span  style="--clr:#1e9bff"  class="details">Enter Email </span>
                        <input class="a1" type="email" name="txtemail" placeholder="Enter your Email" required>
                    </div>

                    <div class="input-details">
                        <span  style="--clr:#1e9bff"  class="details">Enter  phoneno </span>
                        <input class="a1" type="text" name="txtphoneno"   placeholder="Enter Your phone no" required>
                    </div>

                    <div class="input-details">
                        <span   style="--clr:#1e9bff" class="details">Password </span>
                        <input id="txtpassword"   class= "a1" type="password" name="txtpassword" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$" title="Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long"  placeholder="Enter Your new password" required>
                    </div>


                    <div class="input-details">
                        <span   style="--clr:#1e9bff" class="details">Re-password</span>
                        <input  id="txtrepassword"  type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$" title="Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long" class="a1"  name="txtrepassword" placeholder="Enter  password" required>
                    </div>
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" id="examplecheck1"  name="txtcheckbox"> 
                        Agree to terms and conditions
                    </label>
                </div>                
                <div   style="--clr:#1e9bff" class="button">
             <div class="container text-center" id="loader" style="display:none">
             <span class="fa fa-refresh fa-spin" style="font-size:24px;color:white; display: flex;justify-content: center;"></span>
                
                     <h4 style=" color:white; text-align:center">please wait</h4>
                    </div>
                    <button  id="submit-btn" class="btn" type="submit">SUBMIT</button>
                
                </div>
            </form>      
        </div>

        <!--ajax-->


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.js" integrity="sha512-k1jHgQwcMNMFymeyYv93tJOsIGpceFgh5VDTq2B5pF0pICXBzRGY97vlMobgYA4azK7936iOWkqm/C1vv/PKMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            $(document).ready(function () {
            $("#reg-form").on("submit", function (event) {
                    event.preventDefault();//stop default behaviour of form
                     // Check if passwords match
                var password = $("#txtpassword").val();
                var repassword = $("#txtrepassword").val();
                if (password !== repassword) {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Passwords do not match."
                    });
                    return;
                }
                    let formData = $("#reg-form").serialize();
                    $("#submit-btn").hide();
                    //refresh button
                    $("#loader").show();
                    //over
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: formData,
                        success: function (data, txtStatus, jqXHR) {
//                            console.log(data);
                             $("#submit-btn").show();
                               $("#loader").hide();
                            if (data.trim() === "done") {

                                Swal.fire({
                                    title: "Reigstration",
                                    text: "Successfull",
                                    icon: "success"
                                });
                                //redirect login page code
                                swal.fire("register successfully ..we are going redirect to login page").then((value) =>{window.location="signin.jsp";
                                });

                            }
                             else {
                                Swal.fire({
                                    icon: "error",
                                    title: "Oops...",
                                   text: 'Email already register'

                                });
//                                swal.fire(data);
                            }
                        },
                        error: function (jqXHR, txtStatus, errorThrown) {
//                            console.log(jqXHR);
                            $("#submit-btn").show();
                              $("#loader").hide();
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
