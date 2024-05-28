package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteOrdersServlet")
public class DeleteOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST request here
    

        // JDBC URL, username, and password of PostgreSQL server
        String jdbcUrl = "jdbc:postgresql://localhost:5432/postgres";
        String username = "postgres";
        String password = "Taru@2424";

        // Get the order ID parameter from the request
        int orderId = Integer.parseInt(request.getParameter("order_id"));

        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare SQL statement for deletion
            String sql = "DELETE FROM orders WHERE order_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);

            // Execute the SQL statement
            statement.executeUpdate();

            // Close resources
            statement.close();
            connection.close();
            
            request.getRequestDispatcher("view_orders.jsp").forward(request, response);

            // Redirect to a success page or back to view orders
            response.sendRedirect("create_success.jsp"); // Change this to your desired success page

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Forward to error page
            request.getRequestDispatcher("create_success.jsp").forward(request, response);
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
