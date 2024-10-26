<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/27/2024
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <script>
        function validateForm() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            if (newPassword !== confirmPassword) {
                alert("Passwords do not match. Please try again.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-96">
        <h2 class="text-2xl font-bold text-blue-600 mb-6 text-center">Set New Password</h2>
        <form action="/update-password" method="post" class="space-y-4" onsubmit="return validateForm()">
            <input type="hidden" name="token" value="${param.token}" />
            <div>
                <label class="block text-gray-700">New Password</label>
                <input type="password" id="newPassword" name="newPassword" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div>
                <label class="block text-gray-700">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required
                       class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <%String errorMessage = (String) request.getAttribute("errorMessage");
                boolean errorExists = errorMessage != null && !errorMessage.isEmpty();
            %>
            <% if (errorExists) { %>
            <div class="text-red-700 text-center p-2 mb-4 rounded"><%= errorMessage %></div>
            <% } %>
            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition duration-300">
                Reset Password
            </button>
        </form>
    </div>
</div>
</body>
</html>
