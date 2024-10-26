package com.mellisa.aucaregistrationsystem.controller;

import com.mellisa.aucaregistrationsystem.model.Student;
import com.mellisa.aucaregistrationsystem.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @PostMapping("/register")
    public ResponseEntity<Student> registerStudent(@RequestBody Student student) {
        Student registeredStudent = studentService.registerStudent(student);
        return ResponseEntity.status(HttpStatus.CREATED).body(registeredStudent);
    }

    @GetMapping("/{studentNumber}")
    public ResponseEntity<Student> getStudentById(@PathVariable String studentNumber) {
        return studentService.findStudentByStudentNumber(studentNumber)
                .map(ResponseEntity::ok)
                .orElseThrow(() -> new RuntimeException("Student not found!"));
    }

    @GetMapping
    public ResponseEntity<List<Student>> getAllStudents() {
        List<Student> students = studentService.getAllStudents();
        return ResponseEntity.ok(students);
    }
}
