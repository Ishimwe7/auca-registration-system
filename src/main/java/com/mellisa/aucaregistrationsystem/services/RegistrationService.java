package com.mellisa.aucaregistrationsystem.services;

import com.mellisa.aucaregistrationsystem.model.Registration;
import com.mellisa.aucaregistrationsystem.model.Student;
import com.mellisa.aucaregistrationsystem.repositories.RegistrationRepository;
import com.mellisa.aucaregistrationsystem.types.ERegistrationStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RegistrationService {
    @Autowired
    private RegistrationRepository registrationRepository;

    // Method to register a new course
    public Registration registerCourse(Registration registration) {
        return registrationRepository.save(registration);
    }

    // Method to get a registration by its ID
    public Optional<Registration> getRegistrationById(Long id) {
        return registrationRepository.findById(id);
    }
    public List<Registration> getRegistrationByStudent(Student student) {
        return registrationRepository.findByStudentId(student.getId());
    }
    public List<Registration> getRegistrations() {
        return registrationRepository.findAll();
    }
    // Method to get all registrations with optional filtering based on status, studentId, and courseId
    public List<Registration> getAllRegistrations(ERegistrationStatus status, Long studentId, Long courseId) {
        if (status != null && studentId != null && courseId != null) {
            return registrationRepository.findByStatusAndStudentIdAndCourseId(status, studentId, courseId);
        } else if (status != null && studentId != null) {
            return registrationRepository.findByStatusAndStudentId(status, studentId);
        } else if (status != null && courseId != null) {
            return registrationRepository.findByStatusAndCourseId(status, courseId);
        } else if (studentId != null && courseId != null) {
            return registrationRepository.findByStudentIdAndCourseId(studentId, courseId);
        } else if (status != null) {
            return registrationRepository.findByStatus(status);
        } else if (studentId != null) {
            return registrationRepository.findByStudentId(studentId);
        } else if (courseId != null) {
            return registrationRepository.findByCourseId(courseId);
        } else {
            return registrationRepository.findAll();
        }
    }

    // Method to approve a registration
    public Registration approveRegistration(Long id) {
        Registration registration = registrationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Registration not found"));
        registration.setStatus(ERegistrationStatus.APPROVED);
        return registrationRepository.save(registration);
    }

    // Method to reject a registration
    public Registration rejectRegistration(Long id) {
        Registration registration = registrationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Registration not found"));
        registration.setStatus(ERegistrationStatus.REJECTED);
        return registrationRepository.save(registration);
    }

    // Method to delete a registration
    public void deleteRegistration(Long id) {
        registrationRepository.deleteById(id);
    }
}
