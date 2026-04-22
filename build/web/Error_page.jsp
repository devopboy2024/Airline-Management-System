<%-- 
    Document   : Error_page
    Created on : 04-Jan-2024, 11:41:33 pm
    Author     : hp
--%>
<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
/*            .banner-background{
                clip-path:polygon(30% 0%,70% 0%,100% 0%,100% 91%,63% 100%,22% 91%,0 99%,0 0);
            }*/

 
</style>

     
    </head>
    <body>
        <div class="container">          
             <img src="IMG/computer.png" class="img-fluid">
             <h3 class="display-3"> sorry ! something went wrong ..</h3>
             <a href="Home.jsp" class="btn primary-background btn-lg text-white mt-3"> Home</a>
             <%--<%=  exception%>--%>
        </div>     
    </body>
</html>-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link  rel="stylesheet" href="CSS/Error_page.css"></link>
</head>
<body>
    <section class="page_404">
        <div class="container">
            <div class="row">	
            <div class="col-sm-12 ">
            <div class="col-sm-10 col-sm-offset-1  text-center">
            <div class="four_zero_four_bg">
                <h1 class="text-center ">404</h1>         
            
            </div>
            
            <div class="contant_box_404">
            <h3 class="h2">
            Look like you're lost
            <!--<h1>your username and password is invalid</h1>-->
            </h3>
            
            <!-- <p>the page you are looking for not avaible!</p> -->
            <a href="Home.jsp" class="link_404">Go to Home</a>
            <%=exception%>
        </div>
            </div>
            </div>
            </div>
        </div>
    </section>
</body>
</html>