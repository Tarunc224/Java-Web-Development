package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC URL, username, and password of PostgreSQL server
        String jdbcUrl = "jdbc:postgresql://localhost:5432/postgres";
        String username = "postgres";
        String password = "Taru@2424";

        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // SQL query to retrieve orders
            String sql = "SELECT order_id, customer_id, order_date, total_amount, status FROM orders";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Create a list to store orders
            List<Order> orders = new ArrayList<>();

            // Iterate through the result set and populate the list
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int customerId = resultSet.getInt("customer_id");
                Date orderDate = resultSet.getDate("order_date");
                double totalAmount = resultSet.getDouble("total_amount");
                String status = resultSet.getString("status");

                // Create Order object and add it to the list
                Order order = new Order(orderId, customerId, orderDate, totalAmount, status);
                orders.add(order);
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
            
            request.setAttribute("orders", orders);

            // Set orders attribute and forward to the JSP page
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("view_orders.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Forward to error page
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            // Close the connection
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
