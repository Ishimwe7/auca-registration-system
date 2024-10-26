package com.mellisa.aucaregistrationsystem.controller;

import com.mellisa.aucaregistrationsystem.model.Course;
import com.mellisa.aucaregistrationsystem.model.Registration;
import com.mellisa.aucaregistrationsystem.model.Users;
import com.mellisa.aucaregistrationsystem.services.CourseService;
import com.mellisa.aucaregistrationsystem.services.RegistrationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private RegistrationService registrationService;

    @GetMapping("/courses")
    public String adminDashboard(HttpSession session, Model model, @RequestParam(value = "sortBy", required = false) String sortBy) {
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
            model.addAttribute("courses", courses);
            return "allCourses";
        }
        // Redirect to login if not authorized
        return "redirect:/login";
    }

    @GetMapping("/registrations")
    public String registrations(HttpSession session, Model model) {
        // Ensure user is logged in and is an Admin
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user != null && "Admin".equalsIgnoreCase(user.getRole().toString())) {
            model.addAttribute("user", user);
            List<Registration> registrations = registrationService.getRegistrations();
            model.addAttribute("registrations", registrations);
            return "registrationRequests";
        }
        // Redirect to login if not authorized
        return "redirect:/login";
    }


    @GetMapping("/api/courses/sorted")
    @ResponseBody
    public List<Course> getSortedCourses(@RequestParam(value = "sortBy", required = false) String sortBy) {
        List<Course> courses;
        if (sortBy != null) {
            courses = switch (sortBy) {
                case "name" -> courseService.getCoursesSortedByName();
                case "credits" -> courseService.getCoursesSortedByCredits();
                case "capacity" -> courseService.getCoursesSortedByCapacity();
                default -> courseService.getAllCourses();
            };
        } else {
            courses = courseService.getAllCourses();
        }
        return courses;
    }
    @GetMapping("/course/{id}")
    @ResponseBody
    public ResponseEntity<Course> getCourse(@PathVariable Long id) {
        Optional<Course> course = courseService.getCourseById(id);
        return course.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Add new course
    @PostMapping("/course/add")
    public String addCourse(@ModelAttribute Course course, RedirectAttributes redirectAttrs) {
        try {
            course.setAvailable(true);
            course.setRegisteredStudents(0);
            courseService.addCourse(course);
            redirectAttrs.addFlashAttribute("message", "Course added successfully");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to add course: " + e.getMessage());
        }
        return "redirect:/admin/courses";
    }

    // Update existing course
    @PostMapping("/course/update/{id}")
    public String updateCourse(@PathVariable Long id,
                               @ModelAttribute Course course,
                               RedirectAttributes redirectAttrs) {
        try {
            courseService.updateCourse(id, course);
            redirectAttrs.addFlashAttribute("message", "Course updated successfully");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to update course: " + e.getMessage());
        }
        return "redirect:/admin/courses";
    }

    // Delete course
    @PostMapping("/course/delete/{id}")
    public String deleteCourse(@PathVariable Long id, RedirectAttributes redirectAttrs) {
        try {
            courseService.deleteCourse(id);
            redirectAttrs.addFlashAttribute("message", "Course deleted successfully");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to delete course: " + e.getMessage());
        }
        return "redirect:/admin/courses";
    }

    // Approve registration
    @PostMapping("/registration/approve/{id}")
    public String approveRegistration(@PathVariable Long id, RedirectAttributes redirectAttrs) {
        try {
            registrationService.approveRegistration(id);
            redirectAttrs.addFlashAttribute("message", "Registration approved successfully");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to approve registration: " + e.getMessage());
        }
        return "redirect:/admin/registrations";
    }

    // Reject registration
    @PostMapping("/registration/reject/{id}")
    public String rejectRegistration(@PathVariable Long id, RedirectAttributes redirectAttrs) {
        try {
            registrationService.rejectRegistration(id);
            redirectAttrs.addFlashAttribute("message", "Registration rejected successfully");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to reject registration: " + e.getMessage());
        }
        return "redirect:/admin/registrations";
    }

    @ExceptionHandler(Exception.class)
    public String handleError(Exception ex, RedirectAttributes redirectAttrs) {
        redirectAttrs.addFlashAttribute("error", "An error occurred: " + ex.getMessage());
        return "registrationRequests";
    }
}