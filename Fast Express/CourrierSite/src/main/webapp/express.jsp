<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Shipping Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
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

        .main-box {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
            border-radius: 6px;
        }

        h1.center-title {
            text-align: center;
            font-size: 36px;
            margin: 2rem 0 1rem 0;
            color: #2d4059;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 0.3rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        textarea {
            resize: vertical;
        }

        button {
            display: block;
            width: 100%;
            padding: 1rem;
            background-color: #ADD8E6;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }

        button:hover {
            background-color: #87CEEB;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Courier Management Logo">
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

    <!-- Centered Express Shipping Title -->
    <h1 class="center-title">Express Shipping</h1>

    <div class="main-box">
        <form action="save_shipping.jsp" method="POST">
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="productName" placeholder="Enter product name" required>
            </div>

            <div class="form-group">
                <label for="productDimensions">Product Dimensions (L * W * H in cm)</label>
                <input type="text" id="productDimensions" name="productDimensions" placeholder="e.g. 20 * 15 * 10" required>
            </div>

            <div class="form-group">
                <label for="productWeight">Product Weight (kg)</label>
                <input type="text" id="productWeight" name="productWeight" placeholder="Enter product weight" required>
            </div>

            <div class="form-group">
                <label for="productType">Product Type</label>
                <select id="productType" name="productType" required>
                    <option value="Documents">Documents</option>
                    <option value="Fragile">Fragile</option>
                    <option value="Electronics">Electronics</option>
                    <option value="Furniture">Furniture</option>
                    <option value="Hazardous">Hazardous Materials</option>
                </select>
            </div>

            <div class="form-group">
                <label for="pickupTime">Time to Pick Up</label>
                <select id="pickupTime" name="pickupTime" required>
                    <option value="Morning">Morning (8 AM - 12 PM)</option>
                    <option value="Afternoon">Afternoon (12 PM - 4 PM)</option>
                    <option value="Evening">Evening (4 PM - 8 PM)</option>
                </select>
            </div>

            <div class="form-group">
                <label for="fromAddress">From Address</label>
                <textarea id="fromAddress" name="fromAddress" rows="3" placeholder="Sender's Address" required></textarea>
            </div>

            <div class="form-group">
                <label for="toAddress">To Address</label>
                <textarea id="toAddress" name="toAddress" rows="3" placeholder="Recipient's Address" required></textarea>
            </div>

            <div class="form-group">
                <label for="parcelNote">Additional Notes</label>
                <textarea id="parcelNote" name="parcelNote" rows="3" placeholder="Optional"></textarea>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
