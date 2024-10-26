package com.mellisa.aucaregistrationsystem.model;

import com.mellisa.aucaregistrationsystem.types.ERoles;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Getter @Setter
public class Users extends BaseModel{
    private String password;
    @Transient
    private String confirmPassword;
    private ERoles role;
    private boolean active;
    private String profilePictureUrl;
}

