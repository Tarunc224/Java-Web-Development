package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get username and password from the request parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if username and password match
        if (username.equals(password)) {
            // Create a session
            HttpSession session = request.getSession();
            // Store username and password in session attributes
            session.setAttribute("username", username);
            session.setAttribute("password", password);

            // Redirect to a success page
            response.sendRedirect("home.jsp");
        } else {
            // If username and password don't match, display an error message
            PrintWriter out = response.getWriter();
            out.println("<html><body><h2>Invalid username or password</h2></body></html>");
        }
    }
}
