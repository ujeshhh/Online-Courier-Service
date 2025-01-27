<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Handle POST request for login
    String errorMessage = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcoded admin credentials
        String adminUsername = "admin";
        String adminPassword = "admin@123";

        if (username != null && password != null) {
            if (username.equals(adminUsername) && password.equals(adminPassword)) {
                // Successful login - redirect to admin.jsp
                response.sendRedirect("adminpanel.jsp");
                return; // Prevent further processing
            } else {
                errorMessage = "Invalid username or password!";
            }
        } else {
            errorMessage = "Both fields are required!";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Fast Express</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/admin-login-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #2d4059;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, button {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <% if (!errorMessage.isEmpty()) { %>
            <p class="message"><%= errorMessage %></p>
        <% } %>
        <form method="POST" action="">
            <input type="text" name="username" placeholder="Admin Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
