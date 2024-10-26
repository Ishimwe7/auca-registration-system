package com.mellisa.aucaregistrationsystem.services;

import com.mellisa.aucaregistrationsystem.model.Course;
import com.mellisa.aucaregistrationsystem.repositories.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {
    @Autowired
    private CourseRepository courseRepository;

    public Course addCourse(Course course) {
        return courseRepository.save(course);
    }

    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    // Method to get courses sorted by name
    public List<Course> getCoursesSortedByName() {
        return courseRepository.findAll(Sort.by(Sort.Direction.ASC, "courseName"));
    }

    // Method to get courses sorted by credit hours
    public List<Course> getCoursesSortedByCredits() {
        return courseRepository.findAll(Sort.by(Sort.Direction.ASC, "creditHours"));
    }

    // Method to get courses sorted by maximum capacity
    public List<Course> getCoursesSortedByCapacity() {
        return courseRepository.findAll(Sort.by(Sort.Direction.ASC, "maxStudents"));
    }
    public List<Course> getAllAvailableCourses() {
        return courseRepository.findAllByAvailableIsTrue();
    }

    public Course updateCourse(Long id, Course courseDetails) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Course not found with ID: " + id));
        course.setCourseName(courseDetails.getCourseName());
        course.setCourseCode(courseDetails.getCourseCode());
        course.setCreditHours(courseDetails.getCreditHours());
        return courseRepository.save(course);
    }

    public void deleteCourse(Long id) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Course not found with ID: " + id));
        courseRepository.delete(course);
    }
}
