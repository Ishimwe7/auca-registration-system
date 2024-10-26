<%@ page import="com.mellisa.aucaregistrationsystem.model.Users" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Login</title>--%>
<%--    <link rel="stylesheet" href="CSS/signStyles.css">--%>
<%--    <style>--%>
<%--        *{--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>
<%--        body {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: black;--%>
<%--        }--%>

<%--        .container {--%>
<%--            width: 500px;--%>
<%--            margin: 80px auto;--%>
<%--            background-color: #fff;--%>
<%--            padding: 50px 20px;--%>
<%--            border-radius: 15px;--%>
<%--            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);--%>
<%--            /*display: grid;*/--%>
<%--            /*!*justify-content: center;*!*/--%>
<%--            position: relative;--%>
<%--        }--%>
<%--        #rem{--%>
<%--            margin: 10px auto;--%>
<%--            display: flex;--%>
<%--            gap: 10px;--%>
<%--            font-size: x-large;--%>
<%--            font-weight: bold;--%>
<%--            align-items: center;--%>
<%--            justify-content: left;--%>
<%--            padding-left: 30px;--%>
<%--        }--%>
<%--        #rem input{--%>
<%--            width: 20px;--%>
<%--            height: 20px;--%>
<%--        }--%>

<%--        .container h2 {--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 20px;--%>
<%--            font-size: 35px;--%>
<%--        }--%>

<%--        /*form{*/--%>
<%--        /*    margin: auto;*/--%>
<%--        /*}*/--%>

<%--        .input-group {--%>
<%--            margin:20px auto;--%>
<%--            width: 85%;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .input-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .input-group input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border-radius: 5px;--%>
<%--            border: 1px solid #ccc;--%>
<%--        }--%>

<%--        input[type="submit"] {--%>
<%--            width: 100%;--%>
<%--            background-color: #007bff;--%>
<%--            color: #fff;--%>
<%--            padding: 10px;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        p {--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        p a {--%>
<%--            color: #007bff;--%>
<%--            text-decoration: none;--%>
<%--        }--%>

<%--        p a:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>
<%--        .message{--%>
<%--            text-align: center;--%>
<%--            margin: 10px;--%>
<%--            font-size: larger;--%>
<%--        }--%>
<%--        p.success{--%>
<%--            color: green;--%>
<%--        }--%>
<%--        p.error{--%>
<%--            color: red;--%>
<%--        }--%>
<%--        button{--%>
<%--            display: flex;--%>
<%--            margin: 30px auto;--%>
<%--            justify-content: center;--%>
<%--            font-size: larger;--%>
<%--            padding: 3px;--%>
<%--            border-radius: 15px;--%>
<%--            width: 85%;--%>
<%--            background: black;--%>
<%--            color: white;--%>
<%--        }--%>
<%--        button:hover{--%>
<%--            cursor: pointer;--%>
<%--            opacity: 0.7;--%>
<%--        }--%>
<%--        span{--%>
<%--            color: red;--%>
<%--        }--%>
<%--        .log{--%>
<%--            margin: 10px;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <form action="/checkUser" method="post">--%>
<%--        <h2>Login</h2>--%>
<%--        <div class="input-group">--%>
<%--            <label for="email">Email</label>--%>
<%--            <input type="email" id="email" name="email" required>--%>
<%--        </div>--%>
<%--        <div class="input-group">--%>
<%--            <label for="password">Password</label>--%>
<%--            <input type="password" id="password" name="password" required>--%>
<%--        </div>--%>
<%--        <%if(request.getAttribute("invalidLogin")!=null){%>--%>
<%--        <p class="error message" style="color: red"><%=request.getAttribute("invalidLogin")%></p>--%>
<%--        <%}%>--%>
<%--        <%if(request.getAttribute("error")!=null){%>--%>
<%--        <p class="error message" style="color: red"><%=request.getAttribute("error")%></p>--%>
<%--        <%}%>--%>
<%--        <button type="submit">Log In</button>--%>
<%--        <div id="rem"><label for="remember">Remember me </label><input id="remember" name="remember" type="checkbox"></div>--%>
<%--        <p>Don't have an account? <a href="/signup">Sign Up</a></p>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>AUCA Registration System - Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<%
    Users loggedInUser = (Users) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        if ("Student".equalsIgnoreCase(loggedInUser.getRole().toString())) {
            response.sendRedirect("studentDashboard");
        } else if ("Admin".equalsIgnoreCase(loggedInUser.getRole().toString())) {
            response.sendRedirect("adminDashboard");
        }
        return;
    }
%>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-96">
        <h2 class="text-2xl font-bold text-blue-600 mb-6 text-center">AUCA Registration System</h2>
        <form action="login" method="post" class="space-y-4">
            <div>
                <label class="block text-gray-700">Email</label>
                <input type="email" name="email" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <%String loginError = (String) request.getAttribute("error");
              boolean errorExists = loginError != null && !loginError.isEmpty();
                String message = (String) request.getAttribute("message");
                boolean messageSent = message != null && !message.isEmpty();
                String reset = (String) request.getAttribute("resetSuccess");
                boolean resetSuccess = reset != null && !reset.isEmpty();
            %>
            <% if (errorExists) { %>
            <div class="text-red-700 text-center p-2 mb-4 rounded"><%= loginError %></div>
            <% } %>
            <% if (messageSent) { %>
            <div class="text-green-700 text-center p-2 mb-4 rounded"><%= message %></div>
            <% } %>
            <% if (resetSuccess) { %>
            <div class="text-green-700 text-center p-2 mb-4 rounded"><%= reset %></div>
            <% } %>
            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition duration-300">
                Login
            </button>
        </form>
        <p class="mt-4 text-center text-gray-600">
            Don't have an account? <a href="/register" class="text-blue-600 hover:underline">Sign up</a>
        </p>
        <p class="mt-4 text-center text-gray-600">
            Forgot your password? <a href="/reset-password-form" class="text-blue-600 hover:underline">Reset it here</a>
        </p>

    </div>
</div>
</body>
</html>