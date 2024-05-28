<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Order</title>
    <style>
        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
             background-image: url('OrederImage.jpg'); /* Path to your background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container styles */
        .container {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 800px;
            width: 100%;
            animation: fadeIn 0.5s ease-in-out;
             width: 400px;
            padding: 20px;
            border-radius: 8px;
            
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        h2 {
            margin-top: 0;
            text-align: center;
            color: #333;
        }

        /* Form styles */
        form {
            display: flex;
            flex-direction: column;
        }

        /* Label styles */
        label {
            margin-bottom: 10px;
            color: #333;
        }

        /* Input styles */
        input[type=text] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Submit button styles */
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Hover effect for submit button */
        input[type=submit]:hover {
            background-color: #45a049;
        }
        
        /* Navigation bar styles */
        .navbar {
            background-color: #333;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body> 
    <!-- Navigation bar -->
    <div class="navbar">
       <a href="home.jsp">Home</a>
        <a href="createOrder.jsp">Create Order</a>
        <a href="ViewOrdersServlet">View Orders</a>
        <a href="update_order.jsp">Update Order</a>
        <a href="#">Delete Order</a>
    </div>

    <div class="container">
        <h2>Delete Order</h2>
        <form action="DeleteOrdersServlet" method="post">
            <label for="order_id">Order ID:</label>
            <input type="text" id="order_id" name="order_id" placeholder="Enter Order ID" required>
            <input type="submit" value="Delete Order">
        </form>
    </div>
</body>
</html>
