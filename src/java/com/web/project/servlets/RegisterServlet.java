/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;
import com.web.project.dao.UserDao;
import com.web.project.entities.User;
import com.web.project.helper.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;

/**
 *
 * @author hp
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name=request.getParameter("txtname");
            String username=request.getParameter("txtusername");
            String email=request.getParameter("txtemail");
            String phoneno=request.getParameter("txtphoneno");
            String password=request.getParameter("txtpassword");
            String repassword=request.getParameter("txtrepassword");
            String check=request.getParameter("txtcheckbox");
//                out.println("<h2> Name: "+check+"<h2>");
 if (phoneno.length() > 10) {
            out.println("Phone number is too long. Please enter a valid phone number.");
            return;
        }
            if(check==null){
                out.println("Box not checked");
//              RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
//              rd.include(request, response);
         }
            else{
//                out.println("<h2> Name : "+name+"<h2>");
//                out.println("<h2> username : "+username+"<h2>");
//                out.println("<h2> email : "+email+"<h2>");
//                out.println("<h2> phoneno : "+phoneno+"<h2>");
//                out.println("<h2> password : "+password+"<h2>");
//                out.println("<h2> repassword : "+repassword+"<h2>");
//                out.println("<h2> check : "+check+"<h2>");
//                  

                User user=new User(name,username,email,phoneno,password,repassword);
             
                 //1st way to create  separte object ConnectionProvider and userdao
//                ConnectionProvider connection = new ConnectionProvider();
//                UserDao dao=new UserDao((Connection) connection);
               
                UserDao dao = new UserDao(ConnectionProvider.getconnection());// create the object  of userdao to fill the con fro establish connection 
//                out.println(dao);  
                if (dao.savedata(user)) {
                    //save
                    out.print("done");
                    System.out.println("done");
                } else {
                    out.print("error");
                    System.out.println("error");

                }
                
            }          
        }
    }
 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
