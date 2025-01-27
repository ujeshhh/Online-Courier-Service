package signinservlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters from the request
        String username = request.getParameter("signin-username");
        String password = request.getParameter("signin-password");

        // Set content type
        response.setContentType("text/html");

        // Simple hardcoded validation (you can replace this with database validation)
        String correctUsername = "admin";
        String correctPassword = "password123";

        if (username != null && password != null && username.equals(correctUsername) && password.equals(correctPassword)) {
            // Login successful
            try (PrintWriter out = response.getWriter()) {
                out.println("<h1>Sign In Successful!</h1>");
                out.println("<p>Welcome back, " + username + "!</p>");
                // Redirect to a dashboard or home page after successful login
                response.sendRedirect("dashboard.html");
            }
        } else {
            // Login failed
            try (PrintWriter out = response.getWriter()) {
                out.println("<h1>Invalid Credentials</h1>");
                out.println("<p>Please check your username and password and try again.</p>");
            }
        }
    }
}
