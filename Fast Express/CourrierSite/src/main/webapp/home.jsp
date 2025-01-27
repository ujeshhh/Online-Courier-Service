<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Express Courier</title>
    <link rel="stylesheet" href="style.css">
    <script>
        // JavaScript function to navigate to different pages based on button clicks
        function navigateToPage(page) {
            window.location.href = page;
        }
    </script>
</head>
<style>
    /* Global Styles */
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #ADD8E6; /* Light blue background for consistency */
    margin: 0;
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

/* Hero Section */
.hero-section {
    position: relative;
    height: 50vh; /* Adjusted height to 50% of the viewport height */
    background: linear-gradient(135deg, #f76c6c, #f9a825);
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white;
    overflow: hidden;
}


.overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.3);
    z-index: 1;
}

.hero-content {
    z-index: 2;
    position: relative;
    max-width: 800px;
    padding: 0 20px;
}

.hero-content h1 {
    font-size: 4em;
    font-weight: 700;
    letter-spacing: 3px;
    text-transform: uppercase;
    margin-bottom: 20px;
    animation: fadeInDown 1s ease-in-out;
}

.hero-content p {
    font-size: 1.4em;
    margin-bottom: 30px;
    color: #fff;
    animation: fadeInUp 1.2s ease-in-out;
}

.hero-btn {
    background-color: #333;
    color: white;
    padding: 15px 30px;
    font-size: 1.2em;
    border-radius: 5px;
    text-decoration: none;
    transition: background 0.3s ease, transform 0.3s ease;
}

.hero-btn:hover {
    background-color: #f9a825;
    transform: translateY(-3px);
}
/* Animations */
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* About Section */
.about-section {
    padding: 100px 50px;
    background-color: #fff;
    text-align: center;
}

.about-section h2 {
    font-size: 2.5em;
    margin-bottom: 20px;
    color: #2d4059;
}

.about-section p {
    font-size: 1.2em;
    color: #555;
    max-width: 800px;
    margin: 0 auto;
    line-height: 1.8;
}

/* Services Section */
.services-section {
    padding: 100px 50px;
    background-color: #f9f9f9;
    text-align: center;
}

.services-section h2 {
    font-size: 2.5em;
    margin-bottom: 50px;
    color: #2d4059;
}

/* Flexbox container for service cards */
.services-container {
    display: flex;
    justify-content: center;  /* Centers the cards horizontally */
    gap: 30px;  /* Adds space between cards */
    flex-wrap: wrap;  /* Ensures cards wrap on smaller screens */
    margin: 0 auto;  /* Centers the container */
}

/* Service Cards */
.service-card {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
    width: 300px;  /* Set fixed width */
    height: 250px;  /* Set fixed height */
    transition: transform 0.3s, box-shadow 0.3s;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    text-align: left;
    border: none;
}

.service-card button {
    width: 100%;
    height: 100%;
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
    text-align: left;
}

.service-card h3 {
    color: #f76c6c;
    font-size: 1.8em;
    margin-bottom: 15px;
}

.service-card p {
    color: #777;
    line-height: 1.6;
    font-size: 1em;
}

/* Hover effect on service card */
.service-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
}

.service-card button:hover {
    color: #f76c6c;  /* Change text color on hover */
}

/* Booking Section */
.booking-section {
    padding: 100px 50px;
    background-color: #fff;
    text-align: center;
}

.booking-section h2 {
    font-size: 2.5em;
    margin-bottom: 50px;
    color: #2d4059;
}

form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 60%;
    max-width: 600px;
    margin: 0 auto;
    background-color: #f9f9f9;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

form label {
    font-weight: bold;
    color: #333;
}

form input, form select {
    padding: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 1em;
    transition: border-color 0.3s;
}

form input:focus, form select:focus {
    border-color: #f76c6c;
    outline: none;
}

form input[type="submit"] {
    background-color: #f76c6c;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 1.2em;
    padding: 15px;
    transition: background 0.3s;
}

form input[type="submit"]:hover {
    background-color: #f9a825;
}

/* Footer */
footer {
    text-align: center;
    padding: 30px;
    background-color: #2d4059;
    color: white;
    font-size: 1em;
    margin-top: 50px;
}
</style>
<body>
    <!-- Navigation Bar -->
    <header>
        <div class="logo-container">
             <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Courier Management Image">
            <h1>Fast Express</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#booking">Track Now</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="index.jsp">Sign Out</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1>Your Package, Our Priority</h1>
            <p>"We don't just deliver packages, we deliver promises."</p>
            <a href="#booking" class="btn hero-btn">Track Your Shipment</a>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <h2>About Us</h2>
        <p>At Fast Express, we are more than just a delivery service; we are a trusted partner committed to ensuring that your
             packages reach their destination on time and with care. With years of experience in the logistics industry, we have built a 
             reputation for reliability, speed, and customer satisfaction.</p>
    </section>

    <!-- Services Section -->
    <section id="services" class="services-section">
        <h2>Our Services</h2>
        <div class="services-container">
            <div class="service-card">
                <button onclick="navigateToPage('express.jsp')">
                    <h3>Express Shipping</h3>
                    <p>Need it fast? We offer express shipping options to ensure your package arrives quickly.</p>
                </button>
            </div>
            <div class="service-card">
                <button onclick="navigateToPage('standard.jsp')">
                    <h3>Standard Delivery</h3>
                    <p>Reliable and cost-effective delivery for your packages. With our Standard Delivery service,
                         your items will ensure safe and timely arrival at destinations.</p>
                </button>
            </div>
            <div class="service-card">
                <button onclick="navigateToPage('bulk.jsp')">
                    <h3>Bulk Shipping</h3>
                    <p>Efficient shipping solutions for large quantities of goods. Designed for large volumes, 
                        this service ensures your goods are delivered efficiently, ideal for businesses.</p>
                </button>
            </div>
        </div>
    </section>

    <!-- Booking Section -->
    <section id="booking" class="booking-section">
        <h2>Track Your Shipment</h2>
        <form>
            <label for="tracking">Tracking Number:</label>
            <input type="text" id="tracking" name="tracking" required>
            <input type="submit" value="Track Package">
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Fast Express. All rights reserved.</p>
    </footer>
</body>
</html>