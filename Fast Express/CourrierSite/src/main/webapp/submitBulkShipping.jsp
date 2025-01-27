<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
    // Retrieve form data from bulk.jsp
    String productName = request.getParameter("productName");
    String productDimensions = request.getParameter("productDimensions");
    String productWeight = request.getParameter("productWeight");
    String productType = request.getParameter("productType");
    String pickupTime = request.getParameter("pickupTime");
    String fromAddress = request.getParameter("fromAddress");
    String toAddress = request.getParameter("toAddress");
    String parcelNote = request.getParameter("parcelNote");

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/fastexpress";  // Your MySQL URL
    String dbUsername = "root"; // Your MySQL username
    String dbPassword = "ujesh"; // Your MySQL password

    Connection connection = null;
    PreparedStatement pst = null;
    String insertQuery = "INSERT INTO bulk_shipping (product_name, product_dimensions, product_weight, product_type, pickup_time, from_address, to_address, parcel_note) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Prepare SQL query
        pst = connection.prepareStatement(insertQuery);
        pst.setString(1, productName);
        pst.setString(2, productDimensions);
        pst.setString(3, productWeight);
        pst.setString(4, productType);
        pst.setString(5, pickupTime);
        pst.setString(6, fromAddress);
        pst.setString(7, toAddress);
        pst.setString(8, parcelNote);

        // Execute the query
        int result = pst.executeUpdate();

        if (result > 0) {
            // Redirect to payment.jsp after successful insertion
            response.sendRedirect("payment.jsp");
        } else {
            out.println("<h1>Error</h1>");
            out.println("<p>There was an error in submitting the shipping details. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (pst != null) pst.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
