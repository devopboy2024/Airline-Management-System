package com.web.project.servlets;

import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.Order;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.json.JSONObject;

@WebServlet("/createOrder")
public class OrderId extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String amount1 = request.getParameter("amount");
//            double amount = Integer.parseInt(amount1);
           double amount;
            try {
                amount = Double.parseDouble(amount1);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format");
                return;
            }
System.out.println("Pay.com.orderId.doPost()");

            // Validate that amount1 is not null or empty
         
            String apiKey = "rzp_test_xiRvyA4CFh6ime";
            String apiSecret = "LUT1qX3TVoKEBwMe8C0OStek";

            // Set up Razorpay client
            RazorpayClient razorpayClient = new RazorpayClient(apiKey, apiSecret);

            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount*100);
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_11");

            // Create Razorpay order
            Order order = razorpayClient.orders.create(orderRequest);
            String orderId = order.get("id");
//            response.setHeader("Permissions-Policy", "payment=, sync-xhr=, ..."); // Add other necessary policies


            // Send the order ID as a JSON response
            response.setContentType("application/json");
            response.getWriter().write("{\"orderId\": \"" + orderId + "\"}");
        } catch (RazorpayException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating Razorpay order");
        }
    }
}