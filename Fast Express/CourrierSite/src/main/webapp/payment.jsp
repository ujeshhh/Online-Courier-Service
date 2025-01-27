<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Online Courier System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        header {
            background-color: #2d4059;
            padding: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
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
            height: auto;
            margin-right: 10px;
        }
        header .logo-container h1 {
            color: white;
            font-size: 24px;
            font-weight: 600;
        }
        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            color: #f0f0f0;
            text-decoration: none;
            font-weight: 600;
            font-size: 18px;
            transition: color 0.3s;
        }
        nav ul li a:hover {
            color: #f76c6c;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, select, button {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .expiry-container {
            display: flex;
            justify-content: space-between;
        }
        .expiry-container input {
            width: 48%;
        }
        button {
            background: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .summary-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .summary p {
            font-size: 16px;
            margin: 5px 0;
            color: #333;
        }
        .summary strong {
            color: #007bff;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="images/logo.jpg" alt="Fast Express Logo">
            <h1>Fast Express</h1>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="home.jsp">About Us</a></li>
                <li><a href="home.jsp">Services</a></li>
                <li><a href="home.jsp">Track Now</a></li>
                <li><a href="home.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <h2 style="text-align: center; margin-top: 20px;">Order Summary</h2>

    <div class="summary-container">
        <div class="summary">
            <%
                // Database Connection Setup
                String dbUrl = "jdbc:mysql://localhost:3306/fastexpress";
                String dbUsername = "root";
                String dbPassword = "ujesh";
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                    
                    // Query to fetch the latest order
                    String sql = "SELECT * FROM bulk_shipping ORDER BY id DESC LIMIT 1";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String productName = rs.getString("productName");
                        String productDimensions = rs.getString("productDimensions");
                        String productWeight = rs.getString("productWeight");
                        String productType = rs.getString("productType");
                        String fromAddress = rs.getString("fromAddress");
                        String toAddress = rs.getString("toAddress");
                        String pickupTime = rs.getString("pickupTime");
                        String parcelNote = rs.getString("parcelNote");
            %>
                <p><strong>Product Name:</strong> <%= productName %></p>
                <p><strong>Product Dimensions:</strong> <%= productDimensions %></p>
                <p><strong>Product Weight:</strong> <%= productWeight %></p>
                <p><strong>Product Type:</strong> <%= productType %></p>
                <p><strong>From Address:</strong> <%= fromAddress %></p>
                <p><strong>To Address:</strong> <%= toAddress %></p>
                <p><strong>Pickup Time:</strong> <%= pickupTime %></p>
                <p><strong>Parcel Note:</strong> <%= parcelNote %></p>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <div class="container">
        <h1>Payment</h1>
        <form action="processPayment.jsp" method="POST">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="text" name="address" placeholder="Your Address" required>
            <input type="text" name="cardNumber" placeholder="Credit/Debit Card Number" required pattern="\d{16}" title="Please enter a 16-digit card number">
            <div class="expiry-container">
                <input type="number" name="expiryMonth" placeholder="MM" required min="1" max="12" title="Enter month (01-12)">
                <input type="number" name="expiryYear" placeholder="YY" required min="24" max="99" title="Enter year (last two digits)">
            </div>
            <input type="text" name="cvv" placeholder="CVV" required pattern="\d{3}" title="Please enter a 3-digit CVV">
            <select name="paymentMethod" required>
                <option value="" disabled selected>Select Payment Method</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="PayPal">PayPal</option>
                <option value="Gpay">Gpay</option>
            </select>
            <button type="submit">Make Payment</button>
        </form>
    </div>
</body>
</html>
