<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="test.Order" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            text-color:black;
            background-image: url('OrederImage.jpg'); /* Path to your background image */
            background-size: cover;
            background-position: center;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.5);
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

        h2 {
            margin-top: 0;
            text-align: center;
        }

        table {
            text-color:black;
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4caf50;
            color: white;
        }

        /* Style the delete and update buttons */
        .action-btn {
            background-color: #ff6347; /* Coral */
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Add hover effect to buttons */
        .action-btn:hover {
            background-color: #ff4b2b; /* Darker Coral */
        }

        /* Add margin between buttons */
        .action-btn + .action-btn {
            margin-left: 8px;
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
        <h2>View Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Action</th> <!-- Add a new column for actions -->
                </tr>
            </thead>
            <tbody>
             <%  for (Order order : (List<Order>) request.getAttribute("orders")) { %>
                    <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getCustomerId() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td><%= order.getTotalAmount() %></td>
                    <td><%= order.getStatus() %></td>
                    <td>
                        <!-- Add delete button -->
                        <form action="DeleteOrdersServlet" method="post" style="display: inline;">
                            <input type="hidden" name="order_id" value="<%= order.getOrderId() %>">
                            <button type="submit">Delete</button>
                        </form>
                        
                        <!-- Add update button -->
                        <form action="update_order.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="order_id" value="<%= order.getOrderId() %>">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
