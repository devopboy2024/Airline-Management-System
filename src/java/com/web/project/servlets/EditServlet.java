/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.entities.Message;
import com.web.project.entities.User;
import com.web.project.helper.ConnectionProvider;
import com.web.project.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.*;

/**
 *
 * @author hp
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet EditServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");

            //ftech all data
            String useremail = request.getParameter("user_email");
            String name = request.getParameter("user_name");
            String username = request.getParameter("user_username");
            String password = request.getParameter("user_password");
            String phoneno = request.getParameter("user_phoneno");
            Part part = request.getPart("user_profilepic");
            String imageName = part.getSubmittedFileName();
            //get the user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");//create object of session
            if (user != null) {
                user.setEmail(useremail);
                user.setPassword(password);
                user.setName(name);
                user.setUsername(username);
                user.setPhoneno(phoneno);
                user.setProfile(imageName);
                String oldfile=user.getProfile();
                UserDao userdao = new UserDao(ConnectionProvider.getconnection());
                boolean ans = userdao.UpdateUser(user);//create object to update data in registration databases

                String path = request.getServletContext().getRealPath("profilePic") + File.separator + imageName;
                
                String patholdfile = request.getServletContext().getRealPath("profilePic") + File.separator + oldfile;
                if(!oldfile.equals("default.png")){
               Helper.deleteFile(patholdfile);
                }
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.print("success");
                    System.out.println("success");
                    Message f = new Message("profile updated...", "success", "alert-success");
                    s.setAttribute("msge", f);
                    System.out.println("success");
                } else {
                    Message f = new Message("Something went wrong ! ", "error", "alert-danger");
                    s.setAttribute("msge", f);
//                    out.println("error");
                    System.out.println("error");
                }
            }
             else {
                out.println("error");
                Message f = new Message("Something went wrong ! ", "error", "alert-danger");
                s.setAttribute("msge", f);
                System.out.println("error");
            }
            response.sendRedirect("UserLoginDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
