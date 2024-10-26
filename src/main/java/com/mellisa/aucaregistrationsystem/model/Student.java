package com.mellisa.aucaregistrationsystem.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Entity
@Getter
@Setter
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentNumber;
    @OneToOne
    @JoinColumn(name = "user_id")
    private Users user;
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
    private List<Registration> registrations;
}

