<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Fast Express</title>
    <style>
        /* Styles for the admin panel */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/admin-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        header {
            background-color: #2d4059;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left: 20px;
        }
        header .logo-container {
            display: flex;
            align-items: center;
        }
        header .logo-container img {
            width: 40px;
            margin-right: 10px;
        }
        header .logo-container h1 {
            color: white;
            font-size: 24px;
        }
        nav ul {
            list-style: none;
            display: flex;
            margin-right: 20px;
        }
        nav ul li {
            margin: 0 10px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        nav ul li a:hover {
            color: #f76c6c;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #2d4059;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        table th {
            background-color: #2d4059;
            color: white;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="images/logo.jpg" alt="Fast Express Logo">
            <h1>Fast Express Admin</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#dashboard">Dashboard</a></li>
                <li><a href="index.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h1>Admin Dashboard</h1>

        <!-- Express Shipping Table -->
        <h2>Express Shipping Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Dimensions</th>
                    <th>Weight</th>
                    <th>From Address</th>
                    <th>To Address</th>
                    <th>Pickup Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastexpress", "root", "ujesh");
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM express_ship")) {
                        while (rs.next()) {
                            int orderId = rs.getInt("id");
                            String productName = rs.getString("product_name");
                            String dimensions = rs.getString("product_dimensions");
                            String weight = rs.getString("product_weight");
                            String fromAddress = rs.getString("from_address");
                            String toAddress = rs.getString("to_address");
                            String pickupTime = rs.getString("pickup_time");
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= orderId %></td>
                    <td><%= productName %></td>
                    <td><%= dimensions %></td>
                    <td><%= weight %></td>
                    <td><%= fromAddress %></td>
                    <td><%= toAddress %></td>
                    <td><%= pickupTime %></td>
                    <td>
                        <form action="update_status.jsp" method="POST">
                            <input type="hidden" name="order_id" value="<%= orderId %>">
                            <select name="status" onchange="this.form.submit()">
                                <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Order Picked Up" <%= status.equals("Order Picked Up") ? "selected" : "" %>>Order Picked Up</option>
                                <option value="Out for Delivery" <%= status.equals("Out for Delivery") ? "selected" : "" %>>Out for Delivery</option>
                                <option value="Delivered" <%= status.equals("Delivered") ? "selected" : "" %>>Delivered</option>
                            </select>
                        </form>
                    </td>
                    <td>
                        <a href="delete_order.jsp?id=<%= orderId %>" class="btn">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Bulk Shipping Table -->
        <h2>Bulk Shipping Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Dimensions</th>
                    <th>Weight</th>
                    <th>Type</th>
                    <th>Pickup Time</th>
                    <th>From Address</th>
                    <th>To Address</th>
                    <th>Parcel Note</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastexpress", "root", "ujesh");
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM bulk_shipping")) {
                        while (rs.next()) {
                            int orderId = rs.getInt("id");
                            String productName = rs.getString("product_name");
                            String dimensions = rs.getString("product_dimensions");
                            String weight = rs.getString("product_weight");
                            String type = rs.getString("product_type");
                            String pickupTime = rs.getString("pickup_time");
                            String fromAddress = rs.getString("from_address");
                            String toAddress = rs.getString("to_address");
                            String parcelNote = rs.getString("parcel_note");
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= orderId %></td>
                    <td><%= productName %></td>
                    <td><%= dimensions %></td>
                    <td><%= weight %></td>
                    <td><%= type %></td>
                    <td><%= pickupTime %></td>
                    <td><%= fromAddress %></td>
                    <td><%= toAddress %></td>
                    <td><%= parcelNote %></td>
                    <td>
                        <form action="update_bulk_status.jsp" method="POST">
                            <input type="hidden" name="order_id" value="<%= orderId %>">
                            <select name="status" onchange="this.form.submit()">
                                <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Order Picked Up" <%= status.equals("Order Picked Up") ? "selected" : "" %>>Order Picked Up</option>
                                <option value="Out for Delivery" <%= status.equals("Out for Delivery") ? "selected" : "" %>>Out for Delivery</option>
                                <option value="Delivered" <%= status.equals("Delivered") ? "selected" : "" %>>Delivered</option>
                            </select>
                        </form>
                    </td>
                    <td>
                        <a href="delete_bulk_order.jsp?id=<%= orderId %>" class="btn">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='11'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
