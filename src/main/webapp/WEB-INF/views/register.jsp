
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>AUCA Registration System - Sign Up</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center py-12 px-4">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold text-blue-600 mb-6 text-center">Student Registration</h2>
        <%
            String success = (String) request.getAttribute("success");
            String passMis = (String) request.getAttribute("passMis");
            String emailExists = (String) request.getAttribute("emailExists");
            String registrationFailed = (String) request.getAttribute("registrationFailed");
            String uploadError = (String) request.getAttribute("fileError");
            boolean successExists = success != null && !success.isEmpty();
            boolean passMisExists = passMis != null && !passMis.isEmpty();
            boolean emailExistsFlag = emailExists != null && !emailExists.isEmpty();
            boolean fileError = uploadError != null && !success.isEmpty();
            boolean registrationFailedFlag = registrationFailed != null && !registrationFailed.isEmpty();
        %>

        <% if (successExists) { %>
        <div class="bg-green-200 text-green-700 p-2 mb-4 rounded"><%= success %></div>
        <% } %>
        <% if (passMisExists) { %>
        <div class="bg-red-200 text-red-700 p-2 mb-4 rounded"><%= passMis %></div>
        <% } %>
        <% if (emailExistsFlag) { %>
        <div class="bg-red-200 text-red-700 p-2 mb-4 rounded"><%= emailExists %></div>
        <% } %>
        <% if (registrationFailedFlag) { %>
        <div class="bg-red-200 text-red-700 p-2 mb-4 rounded"><%= registrationFailed %></div>
        <% } %>
        <% if (fileError) { %>
        <div class="bg-red-200 text-red-700 p-2 mb-4 rounded"><%= fileError %></div>
        <% } %>
        <form action="/register" method="post" enctype="multipart/form-data" class="space-y-4">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-gray-700">First Name</label>
                    <input type="text" name="firstName" required
                           class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-gray-700">Last Name</label>
                    <input type="text" name="lastName" required
                           class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                </div>
            </div>
            <div>
                <label class="block text-gray-700">Email</label>
                <input type="email" name="email" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Date of Birth</label>
                <input type="date" name="dateOfBirth" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Profile Picture</label>
                <input type="file" name="profilePicture" accept="image/*"
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Confirm Password</label>
                <input type="password" name="confirmPassword" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition duration-300">
                Sign Up
            </button>
        </form>
        <p class="mt-4 text-center text-gray-600">
            Already have an account? <a href="/login" class="text-blue-600 hover:underline">Login</a>
        </p>
    </div>
</div>
</body>
</html>