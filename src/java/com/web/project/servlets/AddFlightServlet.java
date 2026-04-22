/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;
import com.web.project.dao.UserDao;
import com.web.project.entities.AddFlight;
import com.web.project.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author hp
 */
public class AddFlightServlet extends HttpServlet {

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
            String Depature_date=request.getParameter("depature_date");
            String Depature_time=request.getParameter("depature_time");
            String Destination_date=request.getParameter("destination_date");
            String Destination_time=request.getParameter("destination_time");
            String D_from=request.getParameter("Select_from");
            String D_to=request.getParameter("Select_to");
            String Duration=request.getParameter("duration");
            String Price =request.getParameter("price");
            String Select_airline=request.getParameter("Select_airline");
            String Seat_no=request.getParameter("seat_number");
              if (Depature_date.isEmpty() || Depature_time.isEmpty() || Destination_date.isEmpty() || Destination_time.isEmpty() || 
            D_from.isEmpty() || D_to.isEmpty() || Duration.isEmpty() || Price.isEmpty() || Select_airline.isEmpty() || Seat_no.isEmpty()) {
            out.println("All fields are required");
            return;
        }
          try{
              
                 LocalDate Dep_date = LocalDate.parse(Depature_date);
                 LocalDate Des_date = LocalDate.parse(Destination_date);
                 
                 int price = Integer.parseInt(Price); 
                 int seatno=Integer.parseInt(Seat_no);
               UserDao dao=new  UserDao(ConnectionProvider.getconnection());
             AddFlight addflight=new AddFlight(Dep_date,Depature_time,Des_date,Destination_time,D_from,D_to,Duration,price,Select_airline,seatno);    
            if(dao.UserAddFlight(addflight)==true){
               out.println("done");
            }
            else{
                out.println("false");
            }
         
          }
          catch(Exception e){
              e.printStackTrace();
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
