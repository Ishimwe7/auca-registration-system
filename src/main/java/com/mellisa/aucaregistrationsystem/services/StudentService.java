package com.mellisa.aucaregistrationsystem.services;

import com.mellisa.aucaregistrationsystem.model.Student;
import com.mellisa.aucaregistrationsystem.model.Users;
import com.mellisa.aucaregistrationsystem.repositories.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;

    public Student registerStudent(Student student) {
        return studentRepository.save(student);
    }

    public Optional<Student> findStudentByStudentNumber(String studentNumber) {
        return studentRepository.findByStudentNumber(studentNumber);
    }

    public Student findStudentByUser(Users user) {
        return studentRepository.findByUser(user);
    }

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }
}
