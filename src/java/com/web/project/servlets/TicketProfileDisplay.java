/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.project.servlets;

import com.web.project.dao.UserDao;
import com.web.project.entities.AddFlight;
import com.web.project.entities.User;
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
public class TicketProfileDisplay extends HttpServlet {

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
           String flightid=request.getParameter("id");
           String from=request.getParameter("from");
           String to=request.getParameter("to");
           String airline=request.getParameter("airline");
           String depaturedate=request.getParameter("depaturedate");
           String depaturetime=request.getParameter("depaturetime");
           String money=request.getParameter("money");
           String flightclass=request.getParameter("flight-class");
           String seatno=request.getParameter("seatno");
           String arrivaltime=request.getParameter("arrivaltime");
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String phone=request.getParameter("phone");
           String address=request.getParameter("address");
            
           User uss=new User();
           AddFlight book=new AddFlight();
           
           uss.setName(name);
           uss.setEmail(email);
           uss.setPhoneno(phone);
           uss.setaddress(address);
           book.setflightid(flightid);
       LocalDate Dep_date = LocalDate.parse(depaturedate);
           book.setDepature_date(Dep_date);
           book.setDepature_time(depaturetime);
           book.setFlightclass(flightclass);
           book.setSelect_airline(airline);
           book.setfrom(from);
           book.setTo(to);
           int moneyy=Integer.parseInt(money);
           book.setprice(moneyy);
           int seatnoo=Integer.parseInt(seatno);
           book.setSeat_no(seatnoo);
           book.setArrival_time(arrivaltime);
           
           UserDao dao=new UserDao(ConnectionProvider.getconnection()); 
           User bb=dao.ProfileDisplay(uss, book);
           if(bb!=null){
               out.print("data is successfully save");
               HttpSession session=request.getSession();
               session.setAttribute("payment",bb);
               response.sendRedirect("payment.jsp");
//               response.sendRedirect("PaymentRazor.jsp");
           }
           else{
               out.print("data is not stored");
           }
//           out.println(id);
//out.println("<h2>"+flightid+"</h2>");
//out.println("<h2>"+from+"</h2>");
//out.println("<h2>"+to+"</h2>");
//out.println("<h2>"+airline+"</h2>");
//out.println("<h2>"+depaturedate+"</h2>");
//out.println("<h2>"+depaturetime+"</h2>");
//out.println("<h2>"+money+"</h2>");
//out.println("<h2>"+flightclass+"</h2>");
//out.println("<h2>"+seatno+"</h2>");
//out.println("<h2>"+arrivaltime+"</h2>");
//out.println("<h2>"+name+"</h2>");
//out.println("<h2>"+email+"</h2>");
//out.println("<h2>"+phone+"</h2>");
//out.println("<h2>"+address+"</h2>");



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
