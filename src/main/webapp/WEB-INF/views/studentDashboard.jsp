<%@ page import="com.mellisa.aucaregistrationsystem.model.Users" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/23/2024
  Time: 1:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/23/2024
  Time: 1:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<%
    Users loggedInUser = (Users) session.getAttribute("loggedInUser");
    if (loggedInUser == null || !"Student".equalsIgnoreCase(loggedInUser.getRole().toString())) {
        response.sendRedirect("login");
        return;
    }
%>
<body class="bg-gray-100">
<nav class="bg-blue-600 text-white p-4">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-xl font-bold">AUCA Registration System</h1>
        <div class="space-x-4">
            <span>Welcome, <%= loggedInUser.getFirstName()!=null ? loggedInUser.getFirstName() : "Guest" %></span>
            <a href="logout" class="hover:underline">Logout</a>
        </div>
    </div>
</nav>

<div class="container mx-auto p-6">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Available Courses -->
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-bold text-blue-600 mb-4">Available Courses</h2>
            <div class="space-y-4">
                <c:choose>
                    <c:when test="${not empty availableCourses}">
                        <c:forEach items="${availableCourses}" var="course">
                            <div class="border p-4 rounded-md flex gap-4 items-center justify-between">
                                <div>
                                    <h3 class="font-bold">${course.courseName}</h3>
                                    <p class="text-gray-600">Code: ${course.courseCode}</p>
                                    <p class="text-gray-600">Credits: ${course.creditHours}</p>
                                    <p class="text-gray-600">Capacity: ${course.maxStudents}</p>
                                    <p class="text-gray-600">Current: ${course.registeredStudents}</p>
                                </div>
                                <form action="student/registerCourse" method="post" class="mt-2">
                                    <input type="hidden" name="courseId" value="${course.id}">
                                    <button type="submit"
                                            class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700"
                                        ${totalCredits + course.creditHours > 20 ? 'disabled' : ''}>
                                        Add Course
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-gray-600">No Available Courses.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Registered Courses -->
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-bold text-blue-600 mb-4">Registered Courses</h2>
            <p class="mb-4">Total Credits: ${totalCredits}/20</p>
            <div class="space-y-4">
                <c:choose>
                    <c:when test="${not empty registeredCourses}">
                        <c:forEach items="${registeredCourses}" var="registration">
                            <div class="border p-4 rounded-md">
                                <h3 class="font-bold">${registration.course.courseName}</h3>
                                <p class="text-gray-600">Code: ${registration.course.courseCode}</p>
                                <p class="text-gray-600">Credits: ${registration.course.creditHours}</p>
                                <p class="text-gray-600">Status: ${registration.status}</p>
                                <form action="student/dropCourse" method="post" class="mt-2">
                                    <input type="hidden" name="registrationId" value="${registration.id}">
                                    <button type="submit"
                                            class="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700">
                                        Drop Course
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-gray-600">No Registered Courses.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>
