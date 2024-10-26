<%--<%@ page import="com.mellisa.aucaregistrationsystem.model.Users" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: hp--%>
<%--  Date: 10/23/2024--%>
<%--  Time: 1:12 AM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Admin Dashboard</title>--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<%--%>
<%--    Users loggedInUser = (Users) session.getAttribute("loggedInUser");--%>
<%--    if (loggedInUser == null||!"Admin".equalsIgnoreCase(loggedInUser.getRole().toString())) {--%>
<%--        response.sendRedirect("login");--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>
<%--<body class="bg-gray-100">--%>
<%--<nav class="bg-blue-600 text-white p-4">--%>
<%--    <div class="container mx-auto flex justify-between items-center">--%>
<%--        <h1 class="text-xl font-bold">AUCA Admin Dashboard</h1>--%>
<%--        <div class="space-x-4">--%>
<%--            <span>Welcome,<%= loggedInUser.getFirstName()!=null ? " Admin "+loggedInUser.getFirstName() : "Admin" %> </span>--%>
<%--            <a href="logout" class="hover:underline">Logout</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="container mx-auto p-6">--%>
<%--    <!-- Course Management -->--%>
<%--    <div class="bg-white rounded-lg shadow-md p-6 mb-6">--%>
<%--        <h2 class="text-xl font-bold text-blue-600 mb-4">Course Management</h2>--%>

<%--        <!-- Add Course Form -->--%>
<%--        <form action="/admin/course/add" method="post" class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">--%>
<%--            <input type="text" name="courseCode" placeholder="Course Code" required--%>
<%--                   class="px-4 py-2 border rounded-md">--%>
<%--            <input type="text" name="courseName" placeholder="Course Name" required--%>
<%--                   class="px-4 py-2 border rounded-md">--%>
<%--            <input type="number" name="creditHours" placeholder="Credit Hours" required--%>
<%--                   class="px-4 py-2 border rounded-md">--%>
<%--            <input type="number" name="maxStudents" placeholder="Maximum Students" required--%>
<%--                   class="px-4 py-2 border rounded-md">--%>
<%--            <button type="submit"--%>
<%--                    class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">--%>
<%--                Add Course--%>
<%--            </button>--%>
<%--        </form>--%>

<%--        <!-- Courses List -->--%>
<%--        <div class="overflow-x-auto">--%>
<%--            <table class="min-w-full divide-y divide-gray-200">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Code--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Name--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Credits--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Capacity(Students)--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Current(Students)--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Actions--%>
<%--                    </th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody class="bg-white divide-y divide-gray-200">--%>
<%--                <c:forEach items="${courses}" var="course">--%>
<%--                    <tr>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${course.courseCode}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${course.courseName}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${course.creditHours}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${course.maxStudents}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${course.registeredStudents}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap space-x-2">--%>
<%--                            <button onclick="editCourse(${course.id})"--%>
<%--                                    class="bg-yellow-500 text-white px-3 py-1 rounded-md hover:bg-yellow-600">--%>
<%--                                Edit--%>
<%--                            </button>--%>
<%--                            <form action="/admin/course/delete/${course.id}" method="post" class="inline">--%>
<%--                                <input type="hidden" name="courseId" value="${course.id}">--%>
<%--                                <button type="submit"--%>
<%--                                        class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">--%>
<%--                                    Delete--%>
<%--                                </button>--%>
<%--                            </form>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Registration Management -->--%>
<%--    <div class="bg-white rounded-lg shadow-md p-6">--%>
<%--        <h2 class="text-xl font-bold text-blue-600 mb-4">Registration Requests</h2>--%>
<%--        <div class="overflow-x-auto">--%>
<%--            <table class="min-w-full divide-y divide-gray-200">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Student--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Course--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Status--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Registration Date--%>
<%--                    </th>--%>
<%--                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                        Actions--%>
<%--                    </th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody class="bg-white divide-y divide-gray-200">--%>
<%--                <c:forEach items="${registrations}" var="registration">--%>
<%--                    <tr>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">--%>
<%--                                ${registration.student.user.firstName} ${registration.student.user.lastName}--%>
<%--                        </td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${registration.course.courseName}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${registration.status}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap">${registration.registrationDate}</td>--%>
<%--                        <td class="px-6 py-4 whitespace-nowrap space-x-2">--%>
<%--                            <c:if test="${registration.status == 'PENDING'}">--%>
<%--                                <form action="/admin/registration/approve/${registration.id}" method="post" class="inline">--%>
<%--                                    <button type="submit"--%>
<%--                                            class="bg-green-600 text-white px-3 py-1 rounded-md hover:bg-green-700">--%>
<%--                                        Approve--%>
<%--                                    </button>--%>
<%--                                </form>--%>
<%--                                <form action="/admin/registration/reject/${registration.id}" method="post" class="inline">--%>
<%--                                    <button type="submit"--%>
<%--                                            class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">--%>
<%--                                        Reject--%>
<%--                                    </button>--%>
<%--                                </form>--%>
<%--                            </c:if>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Edit Course Modal -->--%>
<%--<div id="editCourseModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">--%>
<%--    <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">--%>
<%--        <div class="mt-3">--%>
<%--            <h3 class="text-lg font-medium text-gray-900 mb-4">Edit Course</h3>--%>
<%--            <form id="editCourseForm" action="/admin/course/update/${editCourseId}" method="post">--%>
<%--                <input type="hidden" id="editCourseId" name="courseId">--%>
<%--                <div class="space-y-4">--%>
<%--                    <div>--%>
<%--                        <label class="block text-gray-700">Course Code</label>--%>
<%--                        <input type="text" id="editCourseCode" name="courseCode" required--%>
<%--                               class="w-full px-4 py-2 border rounded-md">--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label class="block text-gray-700">Course Name</label>--%>
<%--                        <input type="text" id="editCourseName" name="courseName" required--%>
<%--                               class="w-full px-4 py-2 border rounded-md">--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label class="block text-gray-700">Credit Hours</label>--%>
<%--                        <input type="number" id="editCreditHours" name="creditHours" required--%>
<%--                               class="w-full px-4 py-2 border rounded-md">--%>
<%--                    </div>--%>
<%--                    <div class="flex justify-end space-x-3">--%>
<%--                        <button type="button" onclick="closeEditModal()"--%>
<%--                                class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">--%>
<%--                            Cancel--%>
<%--                        </button>--%>
<%--                        <button type="submit"--%>
<%--                                class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">--%>
<%--                            Save Changes--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    function editCourse(courseId) {--%>
<%--        fetch(`/admin/course/${courseId}`)--%>
<%--            .then(response => response.json())--%>
<%--            .then(course => {--%>
<%--                document.getElementById('editCourseId').value = course.id;--%>
<%--                document.getElementById('editCourseCode').value = course.courseCode;--%>
<%--                document.getElementById('editCourseName').value = course.courseName;--%>
<%--                document.getElementById('editCreditHours').value = course.creditHours;--%>
<%--                document.getElementById('editCourseModal').classList.remove('hidden');--%>
<%--            })--%>
<%--            .catch(error => console.error('Error fetching course:', error));--%>
<%--    }--%>

<%--    function closeEditModal() {--%>
<%--        document.getElementById('editCourseModal').classList.add('hidden');--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="com.mellisa.aucaregistrationsystem.model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <style>
        .sidebar a:hover {
            background-color: #4b5563;
        }
        .sidebar a.active {
            background-color: #3b82f6;
        }
    </style>
    <script>
        // JavaScript to toggle visibility of sections
        function showSection(sectionId) {
            document.getElementById("addCourse").style.display = "none";
            document.getElementById("viewCourses").style.display = "none";
            document.getElementById("registrationRequests").style.display = "none";
            document.getElementById(sectionId).style.display = "block";

            // Highlight the active link
            const links = document.querySelectorAll('.sidebar a');
            links.forEach(link => link.classList.remove('active'));
            document.querySelector(`[href="#${sectionId}"]`).classList.add('active');
        }

        // Show Registration Requests by default
        document.addEventListener("DOMContentLoaded", function() {
            showSection("registrationRequests");
        });

        // JavaScript functions for the modal
        function openEditCourseModal(courseId, courseCode, courseName, creditHours, maxStudents) {
            document.getElementById("editCourseModal").style.display = "flex";
            document.getElementById("editCourseId").value = courseId;
            document.getElementById("editCourseCode").value = courseCode;
            document.getElementById("editCourseName").value = courseName;
            document.getElementById("editCreditHours").value = creditHours;
            document.getElementById("editMaxStudents").value = maxStudents;
        }

        function closeEditCourseModal() {
            document.getElementById("editCourseModal").style.display = "none";
        }

        // Functions for pagination
        let currentPage = 1;
        const rowsPerPage = 5;
        let courses = Array.from(document.querySelectorAll('#coursesTable tbody tr'));

        function displayCourses(page) {
            currentPage = page;
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            courses.forEach((course, index) => {
                course.style.display = (index >= start && index < end) ? '' : 'none';
            });
        }

        function nextPage() {
            if ((currentPage * rowsPerPage) < courses.length) {
                displayCourses(currentPage + 1);
            }
        }

        function previousPage() {
            if (currentPage > 1) {
                displayCourses(currentPage - 1);
            }
        }
        // Add these functions below your existing JavaScript code

        function filterCourses() {
            const searchValue = document.getElementById('courseSearch').value.toLowerCase();
            const sortValue = document.getElementById('courseSort').value;

            let filteredCourses = courses.filter(course => {
                return course.querySelector('td:nth-child(2)').textContent.toLowerCase().includes(searchValue);
            });

            const totalPages = Math.ceil(filteredCourses.length / rowsPerPage);
            displayCourses(1, filteredCourses, totalPages);
        }

        function displayCourses(page, filteredCourses = courses, totalPages) {
            currentPage = page;
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            filteredCourses.forEach((course, index) => {
                course.style.display = (index >= start && index < end) ? '' : 'none';
            });

            // Handle pagination buttons
            document.querySelector('.previous-button').disabled = currentPage === 1;
            document.querySelector('.next-button').disabled = currentPage === totalPages;
        }

        // Event Listeners
        document.getElementById('courseSearch').addEventListener('input', filterCourses);
        // document.getElementById('courseSort').addEventListener('change', filterCourses);

        function sortCourses() {
            console.log("Sorting Items...");
            var sortBy = document.getElementById("courseSort").value;
            var url = '/adminDashboard' + (sortBy ? '?sortBy=' + sortBy : '');
            window.location.href = url;
        }
        function filterRegistrations() {
            console.log("Filtering Items...");
            var filterBy = document.getElementById("registrationStatusFilter").value;
            var url = '/adminDashboard' + (filterBy ? '?sortBy=' + filterBy : '');
            window.location.href = url;
        }

    </script>
</head>
<%
    Users loggedInUser = (Users) session.getAttribute("loggedInUser");
    if (loggedInUser == null || !"Admin".equalsIgnoreCase(loggedInUser.getRole().toString())) {
        response.sendRedirect("login");
        return;
    }
%>
<body class="bg-gray-100">
<nav class="bg-blue-600 text-white p-4">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-xl font-bold">AUCA Admin Dashboard</h1>
        <div class="space-x-4">
            <span>Welcome,<%= loggedInUser.getFirstName() != null ? " Admin " + loggedInUser.getFirstName() : "Admin" %></span>
            <a href="logout" class="hover:underline">Logout</a>
        </div>
    </div>
</nav>

<div class="flex">
    <!-- Sidebar -->
    <aside class="sidebar w-64 bg-blue-700 text-white rounded-lg p-6 h-screen fixed">
        <ul>
            <li class="mb-4"><a href="#addCourse" onclick="showSection('addCourse')" class="hover:underline">Add Course</a></li>
            <li class="mb-4"><a href="#viewCourses" onclick="showSection('viewCourses')" class="hover:underline">View All Courses</a></li>
            <li><a href="#registrationRequests" onclick="showSection('registrationRequests')" class="hover:underline">Registration Requests</a></li>
        </ul>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 p-6 ml-64">
        <!-- Add Course Form -->
        <div id="addCourse" class="bg-white rounded-lg w-1/2 shadow-md p-6 m-auto" style="display: none;">
            <h2 class="text-xl font-bold text-blue-600 mb-4">Add Course</h2>
            <form action="/admin/course/add" method="post" class="flex flex-col gap-6 mb-6">
                <input type="text" name="courseCode" placeholder="Course Code" required class="px-4 py-2 border rounded-md">
                <input type="text" name="courseName" placeholder="Course Name" required class="px-4 py-2 border rounded-md">
                <input type="number" name="creditHours" placeholder="Credit Hours" required class="px-4 py-2 border rounded-md">
                <input type="number" name="maxStudents" placeholder="Maximum Students" required class="px-4 py-2 border rounded-md">
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Add Course</button>
            </form>
        </div>

        <!-- View All Courses -->
        <div id="viewCourses" class="bg-white rounded-lg shadow-md p-6 mb-6" style="display: none;">
            <h2 class="text-xl font-bold text-blue-600 mb-4">View All Courses</h2>
            <div class="mb-4 flex gap-2">
                <input type="text" id="courseSearch" placeholder="Search courses..." class="px-4 py-2 border rounded-md">
                <select id="courseSort" class="px-4 py-2 border rounded-md" onchange="sortCourses()">
                    <option value="">Sort by</option>
                    <option value="name">Name</option>
                    <option value="credits">Credits</option>
                    <option value="capacity">Capacity</option>
                </select>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full text-left divide-y divide-gray-200" id="coursesTable">
                    <thead>
                    <tr>
                        <th class="px-6 py-3">Code</th>
                        <th class="px-6 py-3">Name</th>
                        <th class="px-6 py-3">Credits</th>
                        <th class="px-6 py-3">Capacity</th>
                        <th class="px-6 py-3">Current Students</th>
                        <th class="px-6 py-3">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td class="px-6 py-4">${course.courseCode}</td>
                            <td class="px-6 py-4">${course.courseName}</td>
                            <td class="px-6 py-4">${course.creditHours}</td>
                            <td class="px-6 py-4">${course.maxStudents}</td>
                            <td class="px-6 py-4">${course.registeredStudents}</td>
                            <td class="px-6 py-4">
                                <button onclick="openEditCourseModal('${course.id}', '${course.courseCode}', '${course.courseName}', '${course.creditHours}', '${course.maxStudents}')" class="bg-yellow-500 text-white px-3 py-1 rounded-md hover:bg-yellow-600">Edit</button>
                                <form action="/admin/course/delete/${course.id}" method="post" class="inline">
                                    <button type="submit" class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="flex justify-between mt-4">
                <button onclick="previousPage()" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Previous</button>
                <button onclick="nextPage()" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Next</button>
            </div>
        </div>

        <!-- Registration Requests -->
        <div id="registrationRequests" class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-bold text-blue-600 mb-4">Registration Requests</h2>
            <div class="mb-4 flex gap-2">
                <select id="registrationStatusFilter" class="px-4 py-2 border rounded-md">
                    <option value="">Filter by Status</option>
                    <option value="PENDING">Pending</option>
                    <option value="APPROVED">Approved</option>
                    <option value="REJECTED">Rejected</option>
                </select>
                <input type="text" id="registrationSearch" placeholder="Search registrations..." class="px-4 py-2 border rounded-md">
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full text-left divide-y divide-gray-200" id="registrationsTable">
                    <thead>
                    <tr>
                        <th class="px-6 py-3">Student</th>
                        <th class="px-6 py-3">Course</th>
                        <th class="px-6 py-3">Status</th>
                        <th class="px-6 py-3">Date</th>
                        <th class="px-6 py-3">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${registrations}" var="request">
                        <tr>
                            <td class="px-6 py-4">${request.student.user.firstName}</td>
                            <td class="px-6 py-4">${request.course.courseName}</td>
                            <td class="px-6 py-4">${request.status}</td>
                            <td class="px-6 py-4">${request.registrationDate}</td>
                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${request.status == 'PENDING'}">
                                        <form action="/admin/registration/approve/${request.id}" method="post" class="inline">
                                            <button type="submit" class="bg-green-600 text-white px-3 py-1 rounded-md hover:bg-green-700">Approve</button>
                                        </form>
                                        <form action="/admin/registration/reject/${request.id}" method="post" class="inline">
                                            <button type="submit" class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">Reject</button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-600"> No Action</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="flex justify-between mt-4">
                <button onclick="previousPage()" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Previous</button>
                <button onclick="nextPage()" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Next</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit Course Modal -->
<div id="editCourseModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg">
        <h2 class="text-xl font-bold mb-4">Edit Course</h2>
        <form action="/admin/course/update/${courseId}" method="post">
            <input type="hidden" id="editCourseId" name="courseId">
            <input type="text" id="editCourseCode" name="courseCode" placeholder="Course Code" class="block w-full mb-4 px-4 py-2 border rounded-md">
            <input type="text" id="editCourseName" name="courseName" placeholder="Course Name" class="block w-full mb-4 px-4 py-2 border rounded-md">
            <input type="number" id="editCreditHours" name="creditHours" placeholder="Credit Hours" class="block w-full mb-4 px-4 py-2 border rounded-md">
            <input type="number" id="editMaxStudents" name="maxStudents" placeholder="Maximum Students" class="block w-full mb-4 px-4 py-2 border rounded-md">
            <div class="flex justify-end">
                <button type="button" onclick="closeEditCourseModal()" class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600 mr-2">Cancel</button>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Save Changes</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

