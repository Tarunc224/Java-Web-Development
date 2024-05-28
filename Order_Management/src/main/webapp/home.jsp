<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Operations</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-image: url('OrederImage.jpg'); /* Path to your background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 800px;
            width: 100%;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
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

        /* Content styles */
        h1 {
            text-align: center;
            margin-top: 0;
        }

        p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        /* Add more styles/animations as needed */
    </style>
</head>
<body> 
    <!-- Navigation bar -->
    <div class="navbar">
    <a href="home.jsp">Home</a>
    
        <a href="createOrder.jsp">Create Order</a>
        <a href="ViewOrdersServlet">View Orders</a>
        <a href="update_order.jsp">Update Order</a>
        <a href="delete_order.jsp">Delete Order</a>
        <a href="login.jsp">Log Out</a>
    </div>

    <!-- Main content container -->
    <div class="container">
        <h1>Welcome to Our Order Management System</h1>
        <p>Manage your orders efficiently with our user-friendly CRUD operations.</p>
        <p>Click on the navigation links above to perform the desired action:</p>
        <ul>
            <li><strong>Create Order:</strong> Add a new order to the system.</li>
            <li><strong>View Orders:</strong> Browse through existing orders and their details.</li>
            <li><strong>Update Order:</strong> Modify or edit the details of an existing order.</li>
            <li><strong>Delete Order:</strong> Remove an order from the system.</li>
        </ul>
    </div>
</body>
</html>
