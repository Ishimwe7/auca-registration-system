package com.mellisa.aucaregistrationsystem.repositories;

import com.mellisa.aucaregistrationsystem.model.Student;
import com.mellisa.aucaregistrationsystem.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    Optional<Student> findByStudentNumber(String studentNumber);
    Student findByUser(Users user);
}
