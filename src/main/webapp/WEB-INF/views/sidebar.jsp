<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/26/2024
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- sidebar.jsp -->
<%@ page import="com.mellisa.aucaregistrationsystem.model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fixed inset-y-0 left-0 w-64 bg-blue-600 text-white p-6 flex flex-col space-y-4">
    <div class="space-x-4">
        <%
            Users loggedInUser = (Users) session.getAttribute("loggedInUser");
            if (loggedInUser == null || !"Admin".equalsIgnoreCase(loggedInUser.getRole().toString())) {
                response.sendRedirect("login");
                return;
            }
            String profilePictureUrl = loggedInUser.getProfilePictureUrl() != null ? loggedInUser.getProfilePictureUrl() : "/uploads/logo.png";
        %>
        <div class="flex flex-col items-center mb-12">
            <img src="<%= profilePictureUrl %>" alt="Profile Picture" class="w-12 h-12 rounded-full">
            <span><%= loggedInUser.getFirstName() != null ? " " + loggedInUser.getFirstName() : "Admin" %></span>
        </div>
    </div>
    <h2 class="text-2xl font-bold mb-4">Admin Dashboard</h2>
    <nav class="flex flex-col space-y-2">
        <a href="/admin/courses" class="hover:bg-blue-700 p-2 rounded-md">All Courses</a>
        <a href="/admin/registrations" class="hover:bg-blue-700 p-2 rounded-md">Registration Requests</a>
        <a href="/logout" class="hover:bg-blue-700 p-2 rounded-md">Logout</a>
    </nav>
</div>

