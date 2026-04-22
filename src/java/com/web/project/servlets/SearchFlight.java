/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.helper.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author hp
 */
public class SearchFlight extends HttpServlet {

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
            // 
            DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyy");
            String search_depaturedate=request.getParameter("depaturedate");
            
//            LocalDate Dep_date = LocalDate.parse(search_depaturedate);
            
//             String date=Dep_date.format(df);//convert LocalData type into String
             
            String search_from=request.getParameter("from");
            String search_to=request.getParameter("to");
            String search_guest=request.getParameter("guestno");
            
            request.setAttribute("search_from",search_from);
             request.setAttribute("search_to",search_to);
//              request.setAttribute("date",date);
//            UserDao dao=new UserDao(ConnectionProvider.getconnection());
//response.sendRedirect("search.jsp");
//            r
              RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
                dispatcher.forward(request, response);//${requestScope.search_from} used on redirect page to print data
//             boolean f=searchflight(search_from,search_to,date);
//            if(f==true){
//                response.sendRedirect("serchFlight.jsp");
//            }
//            else{
//                response.sendRedirect("Noflight.jsp");
//            }
            
//             out.print("<h2> From:"+search_from+"<h2>");
             
              

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
