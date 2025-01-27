<%@ page import="java.sql.*,java.util.*" %>
<%
    // Get the form data
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String cardNumber = request.getParameter("cardNumber");
    int expiryMonth = Integer.parseInt(request.getParameter("expiryMonth"));
    int expiryYear = Integer.parseInt(request.getParameter("expiryYear"));
    String cvv = request.getParameter("cvv");
    String paymentMethod = request.getParameter("paymentMethod");

    // Database connection
    String dbUrl = "jdbc:mysql://localhost:3306/fastexpress";
    String dbUsername = "root";
    String dbPassword = "ujesh";
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // Insert payment data into the database
        String sql = "INSERT INTO payment (name, address, card_number, expiry_month, expiry_year, cvv, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, address);
        stmt.setString(3, cardNumber);
        stmt.setInt(4, expiryMonth);
        stmt.setInt(5, expiryYear);
        stmt.setString(6, cvv);
        stmt.setString(7, paymentMethod);

        // Execute the insertion
        int result = stmt.executeUpdate();

        if (result > 0) {
            // Redirect to the thank you page
            response.sendRedirect("thankyou.html");
        } else {
            out.println("<h3>Payment failed! Please try again.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error occurred during payment processing.</h3>");
    } finally {
        // Close connections
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
