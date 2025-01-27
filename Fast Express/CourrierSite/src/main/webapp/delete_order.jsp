<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("id");

    String url = "jdbc:mysql://localhost:3306/fastexpress";
    String username = "root";
    String password = "ujesh";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String sql = "DELETE FROM express_ship WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, orderId);

        int rowsDeleted = ps.executeUpdate();
        if (rowsDeleted > 0) {
            response.sendRedirect("adminpanel.jsp");
        } else {
            out.println("<h2>Error: Order not found</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
