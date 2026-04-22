/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.entities.Message;
import com.web.project.entities.User;
import com.web.project.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author hp
 */
public class AdminSevlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username=request.getParameter("txtusername");
            String password=request.getParameter("txtpassword");
             UserDao dao=new UserDao(ConnectionProvider.getconnection());
          boolean ss=dao.AdminLogin(username, password);
          if(ss==true){
              out.print("success");
          }
          else{
              out.print("not matched");
          }
//           if(ss==true){
////               String msg="Invailid detail";
////               HttpSession session=request.getSession();//Again, a session object is obtained from the request.
////               session.setAttribute("session",msg);//: A session object is obtained from the request.
////               response.sendRedirect("Error_page.jsp");
//////               out.print("invalid detail");
//                 Message m=new Message("Invalid Details ! Try with another","alert","alert-danger");
//                HttpSession s=request.getSession();
//                 s.setAttribute("msg",m); 
//                response.sendRedirect("signin.jsp");
//               
////              
//           }
//           else{
//               HttpSession session=request.getSession();//session kaobject nikla
//               session.setAttribute("currentUser",ss);//The returnData, which likely contains user information, is stored in the session attribute with the key "currentUser".
//               response.sendRedirect("UserLoginDashboard.jsp");//url pass kiya redirect hone ka liye  
//           }
            
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
