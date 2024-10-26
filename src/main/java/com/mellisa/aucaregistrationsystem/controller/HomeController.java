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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String registerUser(@ModelAttribute("user") Users user, Model model) {
        model.asMap().clear();
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            model.addAttribute("passMis", "Passwords do not match!");
            return "register";
        }
        if (userService.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("emailExists", "Email already exists!");
            return "register";
        }
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        user.setRole(ERoles.Student);
        user.setActive(true);
        Users savedUser = userService.saveUser(user);
        if(savedUser!=null){
            Student student = new Student();
            student.setUser(savedUser);
            student.setRegistrations(new ArrayList<>());
            Student savedStudent = studentService.registerStudent(student);
            if(savedStudent!=null){
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
                return "redirect:/adminDashboard";
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

    @GetMapping("/adminDashboard")
    public String adminDashboard(HttpSession session, Model model,@RequestParam(value = "sortBy", required = false) String sortBy) {
        // Ensure user is logged in and is an Admin
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user != null && "Admin".equalsIgnoreCase(user.getRole().toString())) {
            model.addAttribute("user", user);
            List<Course> courses ;
            if(sortBy!=null){
                courses = switch (sortBy) {
                    case "name" -> courseService.getCoursesSortedByName();
                    case "credits" -> courseService.getCoursesSortedByCredits();
                    case "capacity" -> courseService.getCoursesSortedByCapacity();
                    default -> courseService.getAllCourses();
                };
            }
            else{
                courses = courseService.getAllCourses();
            }
            List<Registration> registrations = registrationService.getRegistrations();
            model.addAttribute("courses", courses);
            model.addAttribute("registrations", registrations);
            return "adminDashboard";
        }
        // Redirect to login if not authorized
        return "redirect:/login";
    }

    @GetMapping("/**")
    public String handleUnknownRequest() {
        return "noPage";
    }
}
