package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrdersServlet")
public class UpdateOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC URL, username, and password of PostgreSQL server
        String jdbcUrl = "jdbc:postgresql://localhost:5432/postgres";
        String username = "postgres";
        String password = "Taru@2424";

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }

        // Retrieve parameters from the request
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        Date orderDate = Date.valueOf(request.getParameter("order_date"));
        double totalAmount = Double.parseDouble(request.getParameter("total_amount"));
        String status = request.getParameter("status");

        Connection connection = null;
        try {
            // Establish database connection
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare SQL statement for updating the order
            String sql = "UPDATE orders SET customer_id=?, order_date=?, total_amount=?, status=? WHERE order_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            statement.setDate(2, orderDate);
            statement.setDouble(3, totalAmount);
            statement.setString(4, status);
            statement.setInt(5, orderId); // Set the order_id parameter

            // Execute the SQL statement
            statement.executeUpdate();

            // Close resources
            statement.close();
            connection.close();

            // Redirect to a success page
            response.sendRedirect("create_success.jsp");
        } catch (SQLException e) {
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
