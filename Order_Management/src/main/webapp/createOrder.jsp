<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            background-image: url('OrederImage.jpg'); /* Path to your background image */
            background-size: cover;
            background-position: center;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 400px;
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

        h2 {
            margin-top: 0;
            text-align: center;
        }

        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            color: #333;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4caf50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
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
        <a href="delete_order.jsp">Delete Order</a>
    </div>

    <div class="container">
        <h2>Create Order</h2>
        <form action="CreateOrderServlet" method="post">
            <label for="customer_id">Customer ID:</label>
            <input type="number" id="customer_id" name="customer_id" required>

            <label for="order_date">Order Date:</label>
            <input type="date" id="order_date" name="order_date" required>

            <label for="total_amount">Total Amount:</label>
            <input type="number" id="total_amount" name="total_amount" step="0.01" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Pending">Pending</option>
                <option value="Completed">Completed</option>
                <option value="Cancelled">Cancelled</option>
            </select>

            <input type="submit" value="Create">
        </form>
    </div>
</body>
</html>
