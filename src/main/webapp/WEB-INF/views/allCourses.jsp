<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/26/2024
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="sidebar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Courses</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <script>
        function openAddCourseModal() {
            document.getElementById("addCourseModal").style.display = "flex";
        }
        function closeAddCourseModal() {
            document.getElementById("addCourseModal").style.display = "none";
        }
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
    </script>
</head>
<body class="bg-gray-100">
<jsp:include page="sidebar.jsp"/>
<div class="flex-1 p-6 ml-64">
    <div class="flex items-center justify-between">
        <h2 class="text-xl font-bold text-blue-600 mb-4">View All Courses</h2>
        <button onclick="openAddCourseModal()" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 mb-4">Add Course</button>
    </div>
    <div class="overflow-x-auto">
        <table class="min-w-full text-left divide-y rounded-md divide-gray-200" id="coursesTable">
            <thead class="bg-gray-200">
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
</div>

<!-- Add Course Modal -->
<div id="addCourseModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center" style="display: none;">
    <div class="bg-white rounded-lg w-1/3 p-6">
        <h2 class="text-xl font-bold text-blue-600 mb-4">Add Course</h2>
        <form action="/admin/course/add" method="post" class="flex flex-col gap-6">
            <input type="text" name="courseCode" placeholder="Course Code" required class="px-4 py-2 border rounded-md">
            <input type="text" name="courseName" placeholder="Course Name" required class="px-4 py-2 border rounded-md">
            <input type="number" name="creditHours" placeholder="Credit Hours" required class="px-4 py-2 border rounded-md">
            <input type="number" name="maxStudents" placeholder="Maximum Students" required class="px-4 py-2 border rounded-md">
            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeAddCourseModal()" class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Cancel</button>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Add Course</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Course Modal -->
<div id="editCourseModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center" style="display: none;">
    <div class="bg-white rounded-lg w-1/3 p-6">
        <h2 class="text-xl font-bold text-blue-600 mb-4">Edit Course</h2>
        <form action="/admin/course/edit" method="post" class="flex flex-col gap-6">
            <input type="hidden" id="editCourseId" name="courseId">
            <input type="text" id="editCourseCode" name="courseCode" placeholder="Course Code" required class="px-4 py-2 border rounded-md">
            <input type="text" id="editCourseName" name="courseName" placeholder="Course Name" required class="px-4 py-2 border rounded-md">
            <input type="number" id="editCreditHours" name="creditHours" placeholder="Credit Hours" required class="px-4 py-2 border rounded-md">
            <input type="number" id="editMaxStudents" name="maxStudents" placeholder="Maximum Students" required class="px-4 py-2 border rounded-md">
            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeEditCourseModal()" class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Cancel</button>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Save Changes</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

