<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Online Courier System</title>
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
    padding-left: 20px; /* Space for the logo */
}

header .logo-container {
    display: flex;
    align-items: center;
}

header .logo-container img {
    width: 40px; /* Adjust the logo size */
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

html {
    scroll-behavior: smooth;
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
        input, textarea, button {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
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
        .message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Header with Logo and Navigation -->
    <header>
        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Fast Express">
            <h1>Fast Express</h1>
        </div>
        <nav>
             <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="home.jsp#aboutus">About Us</a></li>
                <li><a href="home.jsp#services">Services</a></li>
                <li><a href="home.jsp#booking">Track Now</a></li>
                <li><a href="home.jsp#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Contact Form -->
    <div class="container">
        <h1>Contact Us</h1>
        <form action="processContact.jsp" method="POST">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" placeholder="Your Message" rows="6" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>