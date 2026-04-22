/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.entities.AddFlight;
import com.web.project.entities.Message;
import com.web.project.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;

/**
 *
 * @author hp
 */
public class UpdateFlightServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//           
//            //fetch all data from form
//            String edit_from=request.getParameter("flight_from");
//            String edit_to=request.getParameter("flight_to");
//            String edit_airline=request.getParameter("flight_airline");
//            String edit_deapaturedate=request.getParameter("flight_depaturedate");
//            String edit_depaturetime=request.getParameter("flight_depaturetime");
//            String edit_Arrivaltime=request.getParameter("flight_airlinetime");
////            String edit_seatno=request.getParameter("flight_seatno");
////            String edit_price=request.getParameter("flight_price");
//            
//         
////           int Edit_seatno=Integer.parseInt(edit_seatno);
////          int Edit_price=Integer.parseInt(edit_price);
//          
//         
//          LocalDate Edit_depaturedate=LocalDate.parse(edit_deapaturedate);
//          HttpSession session=request.getSession();
//          AddFlight edit=(AddFlight)session.getAttribute("flight");
//          edit.setfrom(edit_from);
//          edit.setTo(edit_to);
//          edit.setSelect_airline(edit_airline);
//          edit.setDepature_date(Edit_depaturedate);
//          edit.setDepature_time(edit_depaturetime);
//          edit.setArrival_time(edit_Arrivaltime);
////          edit.setSeat_no(Integer.parseInt(edit_seatno));
////          edit.setprice(Integer.parseInt(edit_price));
//          
//        UserDao dao=new UserDao(ConnectionProvider.getconnection());
//        boolean ans=dao.UpdateFlight(edit);//create object to update editflight in addflight table
//        if(ans==true){
//           out.println("Successfully updated");
//                Message m = new Message("profile updated...", "success", "alert-success");
//                    session.setAttribute("msg", m);
//                    out.println("true");
//        }
//        else{
//                   Message m = new Message("Something went wrong ! ", "error", "alert-danger");
//                    session.setAttribute("msg", m);
//                    out.println("false");
//        }
//        response.sendRedirect("Demo2.jsp");
//       
//        }
//        catch(Exception e){
//            e.printStackTrace();
//        }
//    }
    
  protected void processRequest(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    try {

        String edit_from =
                request.getParameter("flight_from");

        String edit_to =
                request.getParameter("flight_to");

        String edit_airline =
                request.getParameter("flight_airline");

        String edit_deapaturedate =
                request.getParameter("flight_depaturedate");

        String edit_depaturetime =
                request.getParameter("flight_depaturetime");

        String edit_Arrivaltime =
                request.getParameter("flight_airlinetime");

        LocalDate Edit_depaturedate =
                LocalDate.parse(edit_deapaturedate);

        HttpSession session =
                request.getSession();

        AddFlight edit =
                (AddFlight) session.getAttribute("flight");

        edit.setfrom(edit_from);
        edit.setTo(edit_to);
        edit.setSelect_airline(edit_airline);
        edit.setDepature_date(Edit_depaturedate);
        edit.setDepature_time(edit_depaturetime);
        edit.setArrival_time(edit_Arrivaltime);

        UserDao dao =
                new UserDao(
                ConnectionProvider.getconnection());

        boolean ans =
                dao.UpdateFlight(edit);

        if (ans) {

            Message m =
            new Message(
            "Flight updated successfully",
            "success",
            "alert-success");

            session.setAttribute("msge", m);

        } else {

            Message m =
            new Message(
            "Something went wrong",
            "error",
            "alert-danger");

            session.setAttribute("msge", m);

        }

        response.sendRedirect("Demo3.jsp");

    }

    catch (Exception e) {

        e.printStackTrace();
        response.sendRedirect("Error_page.jsp");

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
