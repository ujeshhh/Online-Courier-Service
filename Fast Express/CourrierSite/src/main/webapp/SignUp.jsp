<%@ page import="java.sql.*" %>
<%
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (fullname != null && email != null && username != null && password != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastexpress", "root", "ujesh"); // Update credentials

            if (conn != null) {
                out.println("<script>console.log('Database Connection Successful');</script>");
            } else {
                out.println("<script>alert('Database Connection Failed!');</script>");
                return; // Stop execution if no connection
            }

            // Insert User Data into Database
            String query = "INSERT INTO users (fullname, email, username, password) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.setString(4, password);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                // Redirect to signin.jsp after successful signup
                response.sendRedirect("signin.jsp");
            } else {
                out.println("<script>alert('Signup Failed. Please try again!');</script>");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            out.println("<script>alert('Username or Email already exists. Please try a different one.'); window.location.href='SignUp.jsp';</script>");
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='SignUp.jsp';</script>");
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Express - Sign Up</title>
    <style>
        /* General Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ADD8E6;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            overflow: hidden;
        }
        .container {
            display: flex;
            height: 90vh;
            max-width: 1000px;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .left-column {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px 0 0 10px;
        }
        .left-column img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px 0 0 10px;
        }
        .right-column {
            flex: 1;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            border-radius: 0 10px 10px 0;
        }
        .right-column .brand-name {
            font-size: 30px;
            color: #00a9e0;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .right-column h1 {
            font-size: 24px;
            color: #ADD8E6;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            transition: all 0.3s ease-in-out;
        }
        .form-group input:focus {
            border-color: #81c7e0;
            box-shadow: 0 0 5px rgba(129, 199, 224, 0.5);
        }
        button {
            width: 100%;
            padding: 12px;
            background: #81c7e0;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }
        button:hover {
            background: #00a9e0;
            transform: scale(1.05);
        }
        .toggle-link {
            margin-top: 20px;
            font-size: 14px;
        }
        .toggle-link a {
            color: #00a9e0;
            text-decoration: none;
            font-weight: bold;
        }
        .toggle-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-column">
            <img src="<%= request.getContextPath() %>/images/login1.jpg" alt="Courier Management Image">
        </div>
        <div class="right-column">
            <div class="brand-name">Fast Express</div>
            <h1>Sign Up</h1>
            <form method="POST" action="SignUp.jsp">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Choose a username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Choose a password" required>
                </div>
                <button type="submit">Sign Up</button>
                <p class="toggle-link">
                    Already have an account? <a href="signin.jsp">Log in here</a>.
                </p>
            </form>
        </div>
    </div>
</body>
</html>
