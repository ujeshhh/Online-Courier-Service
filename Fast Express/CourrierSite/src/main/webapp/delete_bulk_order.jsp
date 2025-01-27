<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the order ID from the request
    String orderId = request.getParameter("id");

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/fastexpress"; // Replace with your database URL
    String dbUsername = "root"; // Replace with your database username
    String dbPassword = "ujesh"; // Replace with your database password

    Connection connection = null;
    PreparedStatement pst = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Delete query to remove the order by ID
        String deleteQuery = "DELETE FROM bulk_shipping WHERE id = ?";
        pst = connection.prepareStatement(deleteQuery);
        pst.setString(1, orderId);

        int result = pst.executeUpdate();

        if (result > 0) {
            // Redirect back to adminpanel.jsp after successful deletion
            response.sendRedirect("adminpanel.jsp");
        } else {
            out.println("<h1>Error</h1>");
            out.println("<p>Failed to delete the order. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
