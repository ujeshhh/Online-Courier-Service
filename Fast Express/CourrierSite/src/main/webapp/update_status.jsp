<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("order_id");
    String status = request.getParameter("status");

    String url = "jdbc:mysql://localhost:3306/fastexpress";
    String username = "root";
    String password = "ujesh";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        String sql = "UPDATE express_ship SET status = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, status);
        pstmt.setInt(2, Integer.parseInt(orderId));
        pstmt.executeUpdate();
        response.sendRedirect("adminpanel.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
