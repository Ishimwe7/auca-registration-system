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
    <title data-i18n="title">All Courses</title>
    <script src="https://unpkg.com/i18next/i18next.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <script>
        let sortDirection = 'asc';
        let currentPage = 1;
        const itemsPerPage = 6;

        function sortTable() {
            const select = document.getElementById("sortSelect");
            const column = select.value;
            if (!column) return; // Exit if no column is selected

            const table = document.getElementById("coursesTable");
            const tbody = table.querySelector("tbody");
            const rows = Array.from(tbody.querySelectorAll("tr"));

            rows.sort((a, b) => {
                const valA = a.querySelector(`td[data-column='${column}']`).textContent.trim();
                const valB = b.querySelector(`td[data-column='${column}']`).textContent.trim();

                if (column === 'creditHours' || column === 'maxStudents' || column === 'registeredStudents') {
                    // Parse numeric values for sorting
                    return sortDirection === 'asc' ? Number(valA) - Number(valB) : Number(valB) - Number(valA);
                } else {
                    // Perform string comparison
                    return sortDirection === 'asc' ? valA.localeCompare(valB) : valB.localeCompare(valA);
                }
            });

            // Reorder rows in the table
            rows.forEach(row => tbody.appendChild(row));

            // Toggle the sort direction for the next sort
            sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
        }


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

        function paginateTable() {
            const rows = Array.from(document.querySelectorAll("#coursesTable tbody tr"));
            const totalPages = Math.ceil(rows.length / itemsPerPage);

            if (rows.length === 0) {
                document.getElementById("coursesTable").style.display = "none";
                document.getElementById("noCoursesMessage").style.display = "block";
                return;
            } else {
                document.getElementById("coursesTable").style.display = "table";
                document.getElementById("noCoursesMessage").style.display = "none";
            }

            rows.forEach((row, index) => {
                row.style.display = (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) ? '' : 'none';
            });

            document.getElementById("prevButton").disabled = currentPage === 1;
            document.getElementById("nextButton").disabled = currentPage === totalPages;
        }

        function searchCourses() {
            const filter = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("#coursesTable tbody tr");
            rows.forEach(row => {
                const code = row.querySelector("td[data-column='courseCode']").textContent.toLowerCase();
                const name = row.querySelector("td[data-column='courseName']").textContent.toLowerCase();
                row.style.display = code.includes(filter) || name.includes(filter) ? '' : 'none';
            });
            if (!filter) {
                currentPage = 1;
                paginateTable();
            }
        }

        function goToNextPage() {
            currentPage++;
            paginateTable();
        }

        function goToPreviousPage() {
            currentPage--;
            paginateTable();
        }
        document.addEventListener("DOMContentLoaded", () => {
            paginateTable();
        });

        function printTable() {
            const rows = document.querySelectorAll("#coursesTable tbody tr");
            rows.forEach(row => row.style.display = ""); // Temporarily display all rows for printing

            // Hide "Action" column in each row for printing
            rows.forEach(row => {
                const actionCell = row.lastElementChild;
                if (actionCell) actionCell.style.display = "none";
            });

            // Also hide the "Action" header
            const actionHeader = document.querySelector(".coursesTable th:last-child");
            if (actionHeader) actionHeader.style.display = "none";

            const tableContent = document.getElementById("coursesTable").outerHTML;
            const currentDate = new Date();
            const formattedDate = currentDate.toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });
            const printWindow = window.open("", "", "width=800,height=600");

            printWindow.document.write(`
            <html>
                <head>
                    <title>All Courses Records</title>
                    <style>
                        body { font-family: Arial, sans-serif; }
                        h2 { text-align: center; }
                        table { width: 100%; border-collapse: collapse; }
                        th, td { padding: 8px; text-align: left; border: 1px solid #ddd; }
                        th { background-color: #f7f7f7; font-weight: bold; }
                    </style>
                </head>
<body>
                    <h2>AUCA Courses List</h2>
                    <p style="text-align: center;">Printed on: ${formattedDate} </p>
                    ${tableContent}
                    <footer style="text-align: center; margin-top: 20px;">
                        <p>&copy; 2024 AUCA. All rights reserved.</p>
                    </footer>
                </body>
            </html>
        `);

            printWindow.document.close();
            printWindow.print();
            rows.forEach(row => {
                const actionCell = row.lastElementChild;
                if (actionCell) actionCell.style.display = "";
            });
            if (actionHeader) actionHeader.style.display = "";

            paginateTable(rows);
        }
        function validateAddCourseForm() {
            const courseCode = document.getElementsByName("courseCode")[0].value.trim();
            const courseName = document.getElementsByName("courseName")[0].value.trim();
            const creditHours = document.getElementsByName("creditHours")[0].value.trim();
            const maxStudents = document.getElementsByName("maxStudents")[0].value.trim();
            let isValid = true;

            // Clear previous error messages
            document.getElementById("courseCodeError").innerText = "";
            document.getElementById("courseNameError").innerText = "";
            document.getElementById("creditHoursError").innerText = "";
            document.getElementById("maxStudentsError").innerText = "";

            // Course Code Validation
            if (!courseCode) {
                document.getElementById("courseCodeError").innerText = "Course Code is required.";
                isValid = false;
            } else if (!/^[A-Z]{3}\d{3}$/.test(courseCode)) {
                document.getElementById("courseCodeError").innerText = "Course Code must be in the format 'ABC123'.";
                isValid = false;
            }

            // Course Name Validation
            if (!courseName) {
                document.getElementById("courseNameError").innerText = "Course Name is required.";
                isValid = false;
            } else if (courseName.length < 3 || courseName.length > 100) {
                document.getElementById("courseNameError").innerText = "Course Name must be between 3 and 100 characters.";
                isValid = false;
            }

            // Credit Hours Validation
            if (!creditHours) {
                document.getElementById("creditHoursError").innerText = "Credit Hours are required.";
                isValid = false;
            } else if (isNaN(creditHours) || creditHours < 1 || creditHours > 10) {
                document.getElementById("creditHoursError").innerText = "Credit Hours must be a number between 1 and 10.";
                isValid = false;
            }

            // Max Students Validation
            if (!maxStudents) {
                document.getElementById("maxStudentsError").innerText = "Maximum Students is required.";
                isValid = false;
            } else if (isNaN(maxStudents) || maxStudents < 1) {
                document.getElementById("maxStudentsError").innerText = "Maximum Students must be a number greater than 0.";
                isValid = false;
            }

            return isValid;
        }
        function validateEditCourseForm() {
            const courseCode = document.getElementsByName("editCourseCode")[0].value.trim();
            const courseName = document.getElementsByName("editCourseName")[0].value.trim();
            const creditHours = document.getElementsByName("editCreditHours")[0].value.trim();
            const maxStudents = document.getElementsByName("editMaxStudents")[0].value.trim();
            let isValid = true;

            // Clear previous error messages
            document.getElementById("editCourseCodeError").innerText = "";
            document.getElementById("editCourseNameError").innerText = "";
            document.getElementById("editCreditHoursError").innerText = "";
            document.getElementById("editMaxStudentsError").innerText = "";

            // Course Code Validation
            if (!courseCode) {
                document.getElementById("editCourseCodeError").innerText = "Course Code is required.";
                isValid = false;
            } else if (!/^[A-Z]{3}\d{3}$/.test(courseCode)) {
                document.getElementById("editCourseCodeError").innerText = "Course Code must be in the format 'ABC123'.";
                isValid = false;
            }

            // Course Name Validation
            if (!courseName) {
                document.getElementById("editCourseNameError").innerText = "Course Name is required.";
                isValid = false;
            } else if (courseName.length < 3 || courseName.length > 100) {
                document.getElementById("editCourseNameError").innerText = "Course Name must be between 3 and 100 characters.";
                isValid = false;
            }

            // Credit Hours Validation
            if (!creditHours) {
                document.getElementById("editCreditHoursError").innerText = "Credit Hours are required.";
                isValid = false;
            } else if (isNaN(creditHours) || creditHours < 1 || creditHours > 10) {
                document.getElementById("editCreditHoursError").innerText = "Credit Hours must be a number between 1 and 10.";
                isValid = false;
            }

            // Max Students Validation
            if (!maxStudents) {
                document.getElementById("editMaxStudentsError").innerText = "Maximum Students is required.";
                isValid = false;
            } else if (isNaN(maxStudents) || maxStudents < 1) {
                document.getElementById("editMaxStudentsError").innerText = "Maximum Students must be a number greater than 0.";
                isValid = false;
            }

            return isValid; // If true, form submission proceeds; if false, it stops.
        }
    </script>
</head>

<body class="bg-gray-100">
<jsp:include page="sidebar.jsp"/>
<div class="flex-1 p-6 ml-64">
    <div class="flex items-center justify-between">
        <h2 class="text-xl font-bold text-blue-600 mb-4">View All Courses</h2>
        <button onclick="openAddCourseModal()" class="bg-blue-300 text-white px-4 py-2 rounded-md hover:bg-blue-400 mb-4">Add Course</button>
    </div>
    <div class="flex mb-4 gap-4">
        <div class="w-full flex items-center gap-8 justify-between">
            <input type="text" id="searchInput" onkeyup="searchCourses()" placeholder="Search by course code or name..." class="px-4 py-2 border rounded-md w-1/3" />
            <div >
                <button onclick="printTable()" class="bg-blue-300 text-white px-4 py-2 rounded-md hover:bg-blue-400 mb-4">Export Report</button>
                <select id="sortSelect" onchange="sortTable()" class="px-4 py-2 border rounded-md">
                    <option value="">Sort By...</option>
                    <option value="courseCode">Course Code</option>
                    <option value="courseName">Course Name</option>
                    <option value="creditHours">Credit Hours</option>
                    <option value="maxStudents">Capacity</option>
                    <option value="registeredStudents">Current Students</option>
                </select>
            </div>
        </div>
    </div>
    <div class="overflow-x-auto">
        <table class="coursesTable min-w-full text-left divide-y rounded-md divide-gray-200" id="coursesTable">
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
                    <td class="px-6 py-4" data-column="courseCode">${course.courseCode}</td>
                    <td class="px-6 py-4" data-column="courseName">${course.courseName}</td>
                    <td class="px-6 py-4" data-column="creditHours">${course.creditHours}</td>
                    <td class="px-6 py-4" data-column="maxStudents">${course.maxStudents}</td>
                    <td class="px-6 py-4" data-column="registeredStudents">${course.registeredStudents}</td>
                    <td class="px-6 py-4">
                        <button onclick="openEditCourseModal('${course.id}', '${course.courseCode}', '${course.courseName}', '${course.creditHours}', '${course.maxStudents}')" class="bg-yellow-500 text-white px-3 py-1 rounded-md">Edit</button>
                        <form action="/admin/course/delete/${course.id}" method="post" class="inline">
                            <button type="submit" class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="noCoursesMessage" style="display:none;">No courses Found For Search Input.</div>
    </div>
    <div class="flex justify-between items-center mt-4">
        <button id="prevButton" onclick="goToPreviousPage()" class="bg-blue-300 text-white px-4 py-2 rounded-md hover:bg-blue-400" disabled>Previous</button>
        <button id="nextButton" onclick="goToNextPage()" class="bg-blue-300 text-white px-4 py-2 rounded-md hover:bg-blue-400" disabled>Next</button>
    </div>
</div>

<!-- Add Course Modal -->
<div id="addCourseModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center" style="display: none;">
    <div class="bg-white rounded-lg w-1/3 p-6">
        <h2 class="text-xl font-bold text-blue-600 mb-4">Add Course</h2>
        <form action="/admin/course/add" method="post" class="flex flex-col gap-6" onsubmit="return validateAddCourseForm()">
            <div>
                <input type="text" name="courseCode" placeholder="Course Code" required class="w-full px-4 py-2 border rounded-md">
                <p id="courseCodeError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="text" name="courseName" placeholder="Course Name" required class="w-full px-4 py-2 border rounded-md">
                <p id="courseNameError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="number" name="creditHours" placeholder="Credit Hours" required class="w-full px-4 py-2 border rounded-md">
                <p id="creditHoursError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="number" name="maxStudents" placeholder="Maximum Students" required class="w-full px-4 py-2 border rounded-md">
                <p id="maxStudentsError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div class="flex w-full justify-end gap-2">
                <button type="button" onclick="closeAddCourseModal()" class="w-full bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Cancel</button>
                <button type="submit" class="w-full bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Add Course</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Course Modal -->
<div id="editCourseModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center" style="display: none;">
    <div class="bg-white rounded-lg w-1/3 p-6">
        <h2 class="text-xl font-bold text-blue-600 mb-4">Edit Course</h2>
        <form action="/admin/course/edit" method="post" class="flex flex-col gap-6" onsubmit="return validateEditCourseForm()">
            <input type="hidden" name="courseId" id="editCourseId">
            <div>
                <input type="text" id="editCourseCode" name="editCourseCode" placeholder="Course Code" required class="w-full px-4 py-2 border rounded-md">
                <p id="editCourseCodeError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="text" id="editCourseName" name="editCourseName" placeholder="Course Name" required class="w-full px-4 py-2 border rounded-md">
                <p id="editCourseNameError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="number" id="editCreditHours" name="editCreditHours" placeholder="Credit Hours" required class="w-full px-4 py-2 border rounded-md">
                <p id="editCreditHoursError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div>
                <input type="number" id="editMaxStudents" name="editMaxStudents" placeholder="Maximum Students" required class="w-full px-4 py-2 border rounded-md">
                <p id="editMaxStudentsError" class="text-red-500 text-sm mt-1"></p>
            </div>
            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeEditCourseModal()" class="w-full bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Cancel</button>
                <button type="submit" class="w-full bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Edit Course</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>


