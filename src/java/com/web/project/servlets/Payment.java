/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.sun.jdi.connect.spi.Connection;
import com.web.project.dao.UserDao;
import com.web.project.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Payment extends HttpServlet {

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
          String name=request.getParameter("name");
          String address=request.getParameter("address");
          String username=request.getParameter("username");
          String registerationid=request.getParameter("registrationid");
          String flightid=request.getParameter("flightid");
           int   flightidd=Integer.parseInt(flightid);
          String flightname=request.getParameter("flightname");
          String transcation=request.getParameter("transcation");
          UserDao dao=new UserDao(ConnectionProvider.getconnection());
          boolean bb=dao.payment(name,registerationid ,username, address,flightidd , flightname,transcation);
//          out.println("<h2>"+name+"<h2>");
//           out.println("<h2>"+address+"<h2>");
//           out.println("<h2>"+username+"<h2>");
//           out.println("<h2>"+registerationid+"<h2>");
//           out.println("<h2>"+flightid+"<h2>");
//           out.println("<h2>"+flightname+"<h2>");
//           out.println("<h2>"+transcation+"<h2>");
if(bb==false){
    out.print("data is no stored");
    
}
else{
    out.print("data is stored");
    response.sendRedirect("BookingCurrent.jsp");
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
