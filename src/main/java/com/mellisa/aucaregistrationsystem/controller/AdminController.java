package com.mellisa.aucaregistrationsystem.controller;

import com.mellisa.aucaregistrationsystem.model.Course;
import com.mellisa.aucaregistrationsystem.services.CourseService;
import com.mellisa.aucaregistrationsystem.services.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private RegistrationService registrationService;

    // Show admin dashboard
//    @GetMapping("/dashboard")
//    public String showDashboard(Model model) {
//        model.addAttribute("courses", courseService.getAllCourses());
//        model.addAttribute("registrations", registrationService.getAllRegistrations(null, null, null));
//        return "adminDashboard";
//    }

    // Get course details for edit modal
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
        return "redirect:/admin/dashboard";
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
        return "redirect:/admin/dashboard";
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
        return "redirect:/admin/dashboard";
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
        return "redirect:/admin/dashboard";
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
        return "redirect:/admin/dashboard";
    }

    @ExceptionHandler(Exception.class)
    public String handleError(Exception ex, RedirectAttributes redirectAttrs) {
        redirectAttrs.addFlashAttribute("error", "An error occurred: " + ex.getMessage());
        return "redirect:/admin/dashboard";
    }
}