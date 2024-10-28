package com.mellisa.aucaregistrationsystem.controller;

import com.mellisa.aucaregistrationsystem.model.Course;
import com.mellisa.aucaregistrationsystem.model.Registration;
import com.mellisa.aucaregistrationsystem.model.Student;
import com.mellisa.aucaregistrationsystem.model.Users;
import com.mellisa.aucaregistrationsystem.services.CourseService;
import com.mellisa.aucaregistrationsystem.services.RegistrationService;
import com.mellisa.aucaregistrationsystem.services.StudentService;
import com.mellisa.aucaregistrationsystem.services.UserService;
import com.mellisa.aucaregistrationsystem.types.ERoles;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private RegistrationService registrationService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @GetMapping("/")
    public String home() {
        return "index";
    }

    // Show the registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new Users());
        return "register";
    }

    // Handle form submission
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") Users user,
            @RequestParam("profilePicture") MultipartFile profilePicture, Model model) {
        model.asMap().clear();
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            model.addAttribute("passMis", "Passwords do not match!");
            return "register";
        }
        if (userService.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("emailExists", "Email already exists!");
            return "register";
        }
        if (!profilePicture.isEmpty()) {
            try {
                String filePath = uploadDir + File.separator + profilePicture.getOriginalFilename();
                File destinationFile = new File(filePath);
                if (!destinationFile.getParentFile().exists()) {
                    destinationFile.getParentFile().mkdirs();
                }
                profilePicture.transferTo(new File(filePath));
                user.setProfilePictureUrl("uploads/" + profilePicture.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("fileError", "Failed to upload profile picture.");
                return "register";
            }
        }

        if (!profilePicture.isEmpty()) {
            try {
                String filePath = uploadDir + File.separator + profilePicture.getOriginalFilename();
                File destinationFile = new File(filePath);
                if (!destinationFile.getParentFile().exists()) {
                    destinationFile.getParentFile().mkdirs();
                }
                profilePicture.transferTo(new File(filePath));
                user.setProfilePictureUrl("uploads/" + profilePicture.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("fileError", "Failed to upload profile picture.");
                return "register";
            }
        }

        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        user.setRole(ERoles.Student);
        user.setActive(true);
        Users savedUser = userService.saveUser(user);
        if (savedUser != null) {
            Student student = new Student();
            student.setUser(savedUser);
            student.setRegistrations(new ArrayList<>());
            Student savedStudent = studentService.registerStudent(student);
            if (savedStudent != null) {
                model.addAttribute("success", "Registration successful!");
                return "register";
            }
            model.addAttribute("registrationFailed", "User Created Successfully. Student Registration Failed!");
            return "register";
        }
        model.addAttribute("registrationFailed", "Student Registration Failed!");
        return "register";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new Users());
        return "login";
    }

    public Users validateUser(String email, String password) {
        Optional<Users> optionalUser = userService.findUserByEmail(email);
        if (optionalUser.isPresent()) {
            Users user = optionalUser.get();
            if (passwordEncoder.matches(password, user.getPassword())) {
                return user;
            }
        }
        return null;
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {
        Users user = validateUser(email, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            if ("Student".equalsIgnoreCase(user.getRole().toString())) {
                return "redirect:/studentDashboard";
            } else if ("Admin".equalsIgnoreCase(user.getRole().toString())) {
                return "redirect:/admin/registrations";
            }
        }
        // If login fails, show error message
        model.addAttribute("error", "Invalid email or password");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @GetMapping("/studentDashboard")
    public String studentDashboard(HttpSession session, Model model) {
        // Ensure user is logged in and is a Student
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user != null && "Student".equalsIgnoreCase(user.getRole().toString())) {
            model.addAttribute("user", user);
            List<Course> availableCourses = courseService.getAllAvailableCourses();
            model.addAttribute("availableCourses", availableCourses);
            Student student = studentService.findStudentByUser(user);
            List<Registration> registeredCourses = registrationService.getRegistrationByStudent(student);

            int totalCredits = registeredCourses.stream().mapToInt(r -> r.getCourse().getCreditHours()).sum();

            model.addAttribute("registeredCourses", registeredCourses);
            model.addAttribute("totalCredits", totalCredits);
            return "studentDashboard";
        }
        return "redirect:/login";
    }

    @GetMapping("/reset-password-form")
    public String resetPasswordRequestForm() {
        return "reset-password-request";
    }

    @PostMapping("/send-reset-link")
    public String sendResetLink(@RequestParam String email, Model model) {
        boolean isSent = userService.sendResetPasswordEmail(email);
        if (isSent) {
            model.addAttribute("message", "Reset link sent to your email.");
        } else {
            model.addAttribute("error", "Email not found.");
        }
        return "login";
    }

    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        if (!userService.validatePasswordResetToken(token)) {
            model.addAttribute("errorMessage", "Invalid token or token expired.");
            return "reset-password-request";
        }
        model.addAttribute("token", token);
        return "reset-password-form";
    }

    @PostMapping("/update-password")
    public String resetPassword(@RequestParam("token") String token, @RequestParam String newPassword,
            @RequestParam("confirmPassword") String confirmPassword, Model model) {
        if (!userService.validatePasswordResetToken(token)) {
            model.addAttribute("errorMessage", "Invalid token or token expired.");
            return "reset-password-form";
        }
        // Validate token and update password
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("errorMessage", "Passwords do not match. Please try again.");
            return "reset-password-form";
        }
        boolean isUpdated = userService.resetPassword(token, newPassword);
        if (isUpdated) {
            model.addAttribute("resetSuccess",
                    "Password has been reset successfully. <a href=\"/login\" class=\"text-blue-600 hover:underline\">Login</a>");
        } else {
            model.addAttribute("errorMessage", "Invalid token or token expired.");
            return "reset-password-form";
        }
        return "login";
    }

    @GetMapping("/**")
    public String handleUnknownRequest() {
        return "noPage";
    }
}
