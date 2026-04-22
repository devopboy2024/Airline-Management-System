<%-- 
    Document   : PaymentRazor
    Created on : 14-Mar-2024, 9:30:21 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    
    <input type="text" name="amount" placeholder="enter amount" id="amount">
        <button id="rzp-button" class="btn-primary form-control " onclick="paymentStart()">Paynow</button>
        
<script>
    const paymentStart = () => {
        console.log("started");
        let amount = document.getElementById("amount").value;
        if (amount == "" || amount == null) {
            alert("Amount is null");
            return;
        }

        $.ajax({
            url: "Orderld",
            data: { amount: amount, info: "order_request" },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success: function(response) {
                console.log(response);
                // Extract orderId from the response
                let orderId = response.orderId;
                console.log(amount);
                // Use orderId to initiate Razorpay payment
                initiateRazorpayPayment(orderId, amount);
            },
            error: function(error) {
                console.log(error);
                alert("Something went wrong" + error);
            }
        });
        console.log(amount);
    }



            function initiateRazorpayPayment(orderId,amount) {
            var options = {
            key: 'rzp_test_xiRvyA4CFh6ime',
                    amount: amount,
                    currency: 'INR',
                    name: 'ClicknCart',
                    image:'images/logo.png',
                    description: 'Payment for your product/service',
                    order_id: orderId,
                    handler: function (response) {
                    // Handle successful payment response
                    console.log('Payment successful! Payment ID: ' + response.razorpay_payment_id);
                    },
                    prefill: {
                        name:"Rohit",
                email:'4rohit12804@gmail.com',
                    // Add pre-filled customer details if needed
                    },
                    theme: {
//                    color: '#F37254',
                            hide_topbar: false,
                            image_padding: false,
                            // Customize the appearance of the payment form
                    }
            };
            var rzp = new Razorpay(options);
            rzp.open();
            }

        </script>


    
</html>
