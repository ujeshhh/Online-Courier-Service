<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Express - Home</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #ADD8E6; /* Light Blue Solid Background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            overflow: hidden;
        }

        .container {
            text-align: center;
            max-width: 600px;
            width: 100%;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.95);
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #00a9e0;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #81c7e0;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            margin: 10px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #00a9e0;
            transform: scale(1.05);
        }

    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Fast Express</h1>
        <p>Your reliable courier service provider. Please sign in or sign up to continue.</p>

        <a href="SignUp.jsp" class="btn">Sign Up</a>
        <a href="signin.jsp" class="btn">Sign In</a>
        <a href="admin.jsp" class="btn">Admin</a>
    </div>

</body>
</html>
