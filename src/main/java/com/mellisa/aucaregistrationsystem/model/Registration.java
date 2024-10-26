package com.mellisa.aucaregistrationsystem.model;

import com.mellisa.aucaregistrationsystem.types.ERegistrationStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Getter @Setter
public class Registration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "course_id")
    private Course course;
    private LocalDate registrationDate;
    @Enumerated(EnumType.STRING)
    private ERegistrationStatus status;
}

