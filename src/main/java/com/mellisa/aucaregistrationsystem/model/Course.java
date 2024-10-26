package com.mellisa.aucaregistrationsystem.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter @Setter
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String courseCode;
    private String courseName;
    private int creditHours;
    private int maxStudents;
    private int registeredStudents;
    private boolean available;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL)
    private List<Registration> registrations;

}
