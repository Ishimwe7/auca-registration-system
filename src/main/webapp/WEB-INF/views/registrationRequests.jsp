<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/26/2024
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="sidebar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Requests</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<jsp:include page="sidebar.jsp"/>
<div class="flex-1 p-6 ml-64">
    <h2 class="text-xl font-bold text-blue-600 mb-4">Registration Requests</h2>
    <div class="mb-4 flex gap-2">
        <select id="registrationStatusFilter" class="px-4 py-2 border rounded-md" onchange="filterRegistrations()">
            <option value="">Filter by Status</option>
            <option value="PENDING">Pending</option>
            <option value="APPROVED">Approved</option>
            <option value="REJECTED">Rejected</option>
        </select>
        <input type="text" id="registrationSearch" placeholder="Search registrations..." class="px-4 py-2 border rounded-md" oninput="filterRegistrations()">
    </div>
    <div class="overflow-x-auto">
        <table class="min-w-full text-left divide-y divide-gray-200" id="registrationsTable">
            <thead>
            <tr class="bg-gray-200">
                <th class="px-6 py-3">Student</th>
                <th class="px-6 py-3">Course</th>
                <th class="px-6 py-3">Date</th>
                <th class="px-6 py-3">Status</th>
                <th class="px-6 py-3">Actions</th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y rounded-md divide-gray-200">
            <c:forEach items="${registrations}" var="registration">
                <tr>
                    <td class="px-6 py-4"><span>${registration.student.user.firstName}</span>  <span>${registration.student.user.lastName}</span></td>
                    <td class="px-6 py-4">${registration.course.courseName}</td>
                    <td class="px-6 py-4">${registration.registrationDate}</td>
                    <td class="px-6 py-4">${registration.status}</td>
                    <td class="px-6 py-4">
                        <c:choose>
                            <c:when test="${registration.status == 'PENDING'}">
                                <form action="/admin/registration/approve/${registration.id}" method="post" class="inline">
                                    <button type="submit" class="bg-green-600 text-white px-3 py-1 rounded-md hover:bg-green-700">Approve</button>
                                </form>
                                <form action="/admin/registration/reject/${registration.id}" method="post" class="inline">
                                    <button type="submit" class="bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700">Reject</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                No action
                            </c:otherwise>
                        </c:choose>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="flex items-center justify-between mt-4">
        <button id="prevButton" onclick="goToPreviousPage()" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 disabled:opacity-50" disabled>
            Previous
        </button>
        <button id="nextButton" onclick="goToNextPage()" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">
            Next
        </button>
    </div>
</div>
<script>
    let currentPage = 1;
    const itemsPerPage = 6;
    function paginateTable() {
        const rows = Array.from(document.querySelectorAll("#registrationsTable tbody tr"));
        const totalPages = Math.ceil(rows.length / itemsPerPage);

        if (rows.length === 0) {
            document.getElementById("registrationsTable").style.display = "none";
            document.getElementById("noCoursesMessage").style.display = "block";
            return;
        } else {
            document.getElementById("registrationsTable").style.display = "table";
            document.getElementById("noCoursesMessage").style.display = "none";
        }

        rows.forEach((row, index) => {
            row.style.display = (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) ? '' : 'none';
        });

        document.getElementById("prevButton").disabled = currentPage === 1;
        document.getElementById("nextButton").disabled = currentPage === totalPages;
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


    function filterRegistrations() {
        const filter = document.getElementById("registrationStatusFilter").value;
        const search = document.getElementById("registrationSearch").value.toLowerCase();
        const table = document.querySelector("tbody");
        const rows = table.getElementsByTagName("tr");

        if (!filter) {
            currentPage = 1;
            paginateTable();
        }

        for (let i = 0; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName("td");
            const status = cells[3].textContent || cells[3].innerText;
            const studentName = cells[0].textContent || cells[0].innerText;
            const courseName = cells[1].textContent || cells[1].innerText;

            const statusMatch = !filter || status === filter;
            const searchMatch = studentName.toLowerCase().includes(search) || courseName.toLowerCase().includes(search);

            rows[i].style.display = statusMatch && searchMatch ? "" : "none";
        }
    }
</script>
</body>
</html>
