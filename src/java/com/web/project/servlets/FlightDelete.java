/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.helper.ConnectionProvider;
import static com.web.project.helper.ConnectionProvider.getconnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class FlightDelete extends HttpServlet {

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
//            out.println("<title>Servlet FlightDelete</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet FlightDelete at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            String searchid=request.getParameter("flight-id");
           
            int searchidd=Integer.parseInt(searchid);
//            out.println("<h2>"+searchid+"</h2>");
            String searchname=request.getParameter("uname");
//            out.println("<h2>"+searchname+"</h2>");

UserDao dao=new UserDao(ConnectionProvider.getconnection());
boolean del=dao.Flightdelete(searchidd,searchname);
if(del==true){
//    String message="success";
//    HttpSession session=request.getSession();
//    session.setAttribute("delete",message);
    response.sendRedirect("FlightAdminBookingStatus.jsp"); 
 out.print("true");
}
else{
//    out.print("error");
//String message="error";
//    HttpSession session=request.getSession();
//    session.setAttribute("delete",message);
    response.sendRedirect("Error_page.jsp"); 
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
