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
    <h2 class="text-2xl font-bold mb-4" data-i18n="dashboardTitle">Admin Dashboard</h2>
    <nav class="flex flex-col space-y-2">
        <a href="/admin/courses" class="hover:bg-blue-700 p-2 rounded-md" data-i18n="allCourses">All Courses</a>
        <a href="/admin/registrations" class="hover:bg-blue-700 p-2 rounded-md" data-i18n="registrationRequests">Registration Requests</a>
        <label for="languageSelect" data-i18n="chooseLanguage">Choose Language: </label>
        <select id="languageSelect" onchange="changeLanguage()" class=" border border-blue rounded-md p-1">
                <option class="text-white bg-blue" value="en">English</option>
                <option value="es">Spanish</option>
                <option value="rw">Kinyarwanda</option>
                <option value="fr">French</option>
            </select>
        <a href="/logout" class="hover:bg-blue-700 p-2 rounded-md" data-i18n="logout">Logout</a>
    </nav>
</div>

<script src="https://unpkg.com/i18next/i18next.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const resources = {
            en: {
                translation: {
                    dashboardTitle: "Admin Dashboard",
                    allCourses: "All Courses",
                    registrationRequests: "Registration Requests",
                    chooseLanguage: "Choose Language: ",
                    logout: "Logout"
                }
            },
            es: {
                translation: {
                    dashboardTitle: "Tablero de Administrador",
                    allCourses: "Todos los Cursos",
                    registrationRequests: "Solicitudes de Registro",
                    chooseLanguage: "Elige idioma: ",
                    logout: "Cerrar sesión"
                }
            },
            fr: {
                translation: {
                    dashboardTitle: "Tableau de bord de l'administrateur",
                    allCourses: "Tous les cours",
                    registrationRequests: "Demandes d'inscription",
                    chooseLanguage: "Choisissez une langue: ",
                    logout: "Se déconnecter"
                }
            },
            rw: {
                translation: {
                    dashboardTitle: "Dashboard y'Umuyobozi",
                    allCourses: "Amasomo Yose",
                    registrationRequests: "Ibisabwa ku Mugereka",
                    chooseLanguage: "Hitamo Ururimi: ",
                    logout: "Sohoka"
                }
            }
        };

        i18next.init({
            lng: 'en',
            resources: resources
        }, function (err, t) {
            updateContent();  // Update content after initialization
        });

        window.changeLanguage = function() {
            const lang = document.getElementById('languageSelect').value;
            console.log("Changing Language....");
            i18next.changeLanguage(lang, (err) => {
                if (err) {
                    console.error('Error changing language:', err);
                    return;
                }
                updateContent();
            });
        };

        function updateContent() {
            document.querySelectorAll('[data-i18n]').forEach(element => {
                const key = element.getAttribute('data-i18n');
                element.innerHTML = i18next.t(key);
            });
        }
    });
</script>

