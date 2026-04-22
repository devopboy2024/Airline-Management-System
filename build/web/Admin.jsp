<%-- 
    Document   : Admin
    Created on : 04-Feb-2024, 10:28:14 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/Admin.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
        <title> CSS Login Screen Tutorial </title>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <div class="login">
                    <div class="login-header">
                        <h3>LOGIN</h3>
                      <p>Please enter your credentials to login.</p>
                    </div>
                </div>
                <form  class="login-form" id="submit-form">
                    <input type="text" placeholder="username" name="txtusername"/>
                    <input type="password" placeholder="password" name="txtpassword"/>
                    <input type="submit" value="Login" class="button">
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </form>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.2/sweetalert2.min.js" integrity="sha512-k1jHgQwcMNMFymeyYv93tJOsIGpceFgh5VDTq2B5pF0pICXBzRGY97vlMobgYA4azK7936iOWkqm/C1vv/PKMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    </body>
</html>