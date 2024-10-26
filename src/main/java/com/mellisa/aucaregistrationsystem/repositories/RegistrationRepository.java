package com.mellisa.aucaregistrationsystem.repositories;

import com.mellisa.aucaregistrationsystem.model.Registration;
import com.mellisa.aucaregistrationsystem.types.ERegistrationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    List<Registration> findByStatus(ERegistrationStatus status);

    List<Registration> findByStudentId(Long studentId);

    List<Registration> findByCourseId(Long courseId);

    List<Registration> findByStatusAndStudentId(ERegistrationStatus status, Long studentId);

    List<Registration> findByStatusAndCourseId(ERegistrationStatus status, Long courseId);

    List<Registration> findByStudentIdAndCourseId(Long studentId, Long courseId);

    List<Registration> findByStatusAndStudentIdAndCourseId(ERegistrationStatus status, Long studentId, Long courseId);
}
