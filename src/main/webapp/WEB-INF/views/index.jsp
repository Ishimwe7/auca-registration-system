<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <title>AUCA Registration Portal</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f0f8ff; /* Light blue background */
            color: #333;
            overflow-x: hidden;
        }

        /* Navigation bar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #0056b3; /* AUCA Blue */
            padding: 10px 20px;
            color: white;
        }

        .navbar .logo img {
            width: 150px;
        }

        .navbar .nav-links {
            display: flex;
            gap: 35px;
        }

        .navbar .nav-links a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            transition: color 0.3s;
        }

        .navbar .nav-links a:hover {
            color: #f0f8ff; /* Lighter shade on hover */
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            text-align: center;
            padding: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        header h2 {
            font-size: 45px;
            margin-bottom: 10px;
            color: #0056b3; /* AUCA Blue */
            animation: slideIn 1.5s ease-in-out;
        }

        header p {
            font-size: 20px;
            margin-bottom: 30px;
            color: #333;
            animation: slideIn 2s ease-in-out;
        }

        .image {
            margin-top: 30px;
            animation: slideIn 3s ease-in-out;
        }

        .image img {
            width: 100%;
            max-width: 600px;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        .image img:hover {
            transform: scale(1.05);
        }

        .about, .features {
            text-align: left;
            margin-top: 50px;
            animation: fadeIn 3s ease-in-out;
        }

        .about h2, .features h2 {
            color: #0056b3;
            margin-bottom: 15px;
        }

        .about p, .features ul {
            color: #333;
            font-size: 18px;
            line-height: 1.6;
        }

        .features ul {
            list-style-type: none;
            padding: 0;
        }

        .features ul li {
            padding: 10px 0;
        }

        footer {
            margin-top: 50px;
            padding: 20px;
            background: #0056b3;
            color: white;
            text-align: center;
            animation: fadeIn 4s ease-in-out;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .auth{
            display: flex;
            justify-content: center;
            gap: 5px;
            align-items: center;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<div class="navbar">
    <!-- Logo -->
    <div class="logo">
        <img src="./logo.png" alt="AUCA Logo">
    </div>
    <!-- Navigation Links -->
    <div class="nav-links">
        <a class="auth" href="/login"><span>Login</span> <span class="material-icons-sharp">login</span></a>
        <a class="auth" href="/signup"><span>Sign Up</span> <span class="material-icons-sharp">how_to_reg</span></a>
    </div>
</div>

<div class="container">
    <!-- Header Section -->
    <header>
        <h2>Welcome to AUCA Registration Portal!</h2>
        <p>Your gateway to an organized and efficient registration process.</p>
        <p>Start your journey with us today.</p>
    </header>

    <!-- Image Section -->
    <div class="image">
        <img src="./background.png" alt="AUCA Campus Image">
    </div>

    <!-- About Section -->
    <div class="about">
        <h2>About AUCA</h2>
        <p>Adventist University of Central Africa (AUCA) is a renowned institution known for its commitment to academic excellence and spiritual growth. Our registration portal simplifies the course registration process for students and staff, making it accessible and user-friendly.</p>
    </div>

    <!-- Features Section -->
    <div class="features">
        <h2>Features of the Registration Portal</h2>
        <ul>
            <li>✔ Easy and quick course registration for students</li>
            <li>✔ Administrative management for registration processes</li>
            <li>✔ Real-time updates on registration status</li>
            <li>✔ Secure and reliable system for handling student data</li>
            <li>✔ Mobile-friendly interface for on-the-go access</li>
        </ul>
    </div>
</div>

<!-- Footer Section -->
<footer>
    <p>&copy; 2024 Adventist University of Central Africa. All rights reserved.</p>
    <p>Contact us: <a href="mailto:info@auca.ac.rw" style="color: white;">info@auca.ac.rw</a> | Tel: +250 123 456 789</p>
    <p>Follow us on:
        <a href="#" style="color: white;">Facebook</a> |
        <a href="#" style="color: white;">Twitter</a> |
        <a href="#" style="color: white;">LinkedIn</a>
    </p>
</footer>
<script src="JS/scripts.js"></script>
</body>
</html>
