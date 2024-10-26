package com.mellisa.aucaregistrationsystem.controller;

import com.mellisa.aucaregistrationsystem.model.Registration;
import com.mellisa.aucaregistrationsystem.services.RegistrationService;
import com.mellisa.aucaregistrationsystem.types.ERegistrationStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/registrations")
public class RegistrationController {
    @Autowired
    private RegistrationService registrationService;

    // Register a new course for a student
    @PostMapping
    public ResponseEntity<Registration> registerCourse(@RequestBody Registration registration) {
        Registration newRegistration = registrationService.registerCourse(registration);
        return ResponseEntity.status(HttpStatus.CREATED).body(newRegistration);
    }

    // Get a registration by ID
    @GetMapping("/{id}")
    public ResponseEntity<Registration> getRegistrationById(@PathVariable Long id) {
        Optional<Registration> registration = registrationService.getRegistrationById(id);
        return registration.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    // Get all registrations with optional filtering
    @GetMapping
    public ResponseEntity<List<Registration>> getAllRegistrations(
            @RequestParam(required = false) ERegistrationStatus status,
            @RequestParam(required = false) Long studentId,
            @RequestParam(required = false) Long courseId) {
        List<Registration> registrations = registrationService.getAllRegistrations(status, studentId, courseId);
        return ResponseEntity.ok(registrations);
    }

    // Approve a registration
    @PutMapping("/{id}/approve")
    public ResponseEntity<Registration> approveRegistration(@PathVariable Long id) {
        Registration approvedRegistration = registrationService.approveRegistration(id);
        return ResponseEntity.ok(approvedRegistration);
    }

    // Reject a registration
    @PutMapping("/{id}/reject")
    public ResponseEntity<Registration> rejectRegistration(@PathVariable Long id) {
        Registration rejectedRegistration = registrationService.rejectRegistration(id);
        return ResponseEntity.ok(rejectedRegistration);
    }

    // Delete a registration
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteRegistration(@PathVariable Long id) {
        registrationService.deleteRegistration(id);
        return ResponseEntity.noContent().build();
    }
}
