
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.web.project.entities.Message" %>
<%@page import="com.web.project.servlets.LoginServlet"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="CSS/signin.css" rel="stylesheet" type="text/css"/>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>
    <body style=" background-color: black">
        <div class="box">
            <span class="borderline"></span>
            <form action="LoginServlet" method="POST">
                <h2><u>Sign In</u></h2>         
                
                <div class="inputbox">
                    <input type="text" name="txtusername" required>
                    <span>username</span>
                    <i></i>
                </div>
                <div class="inputbox">
                    <input type="password" name="txtpassword" required>
                    <span>Password</span>
                    <i></i>
                           </div>

                <div class="links">
                    <a href="sinup.jsp"> Forgot password</a>
                    <a href="Home.jsp" style="color: black">Back</a>
                </div>

                <input type="submit" value="Login"> 
                           <%
           Message m=(Message)session.getAttribute("msg");
           if(m!=null){//session null value nhi aaye to iska mtlb message hoga
           %>
           <div class="alert <%=m.getcssclass()%>" role="alert" >
                      <%=m.getcontent()%>
              </div>   
            
            <%
                
                session.removeAttribute("msg");
                        }
                %>
            </form>
        </div>
    </body>

</html>
