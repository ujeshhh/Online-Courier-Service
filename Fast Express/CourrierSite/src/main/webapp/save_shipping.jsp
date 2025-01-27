<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/fastexpress";
    String username = "root";
    String password = "ujesh";

    String productName = request.getParameter("productName");
    String productDimensions = request.getParameter("productDimensions");
    String productWeight = request.getParameter("productWeight");
    String productType = request.getParameter("productType");
    String pickupTime = request.getParameter("pickupTime");
    String fromAddress = request.getParameter("fromAddress");
    String toAddress = request.getParameter("toAddress");
    String parcelNote = request.getParameter("parcelNote");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String sql = "INSERT INTO express_ship (product_name, product_dimensions, product_weight, product_type, pickup_time, from_address, to_address, parcel_note) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        
        ps.setString(1, productName);
        ps.setString(2, productDimensions);
        ps.setString(3, productWeight);
        ps.setString(4, productType);
        ps.setString(5, pickupTime);
        ps.setString(6, fromAddress);
        ps.setString(7, toAddress);
        ps.setString(8, parcelNote);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("payment.jsp");
        }
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
