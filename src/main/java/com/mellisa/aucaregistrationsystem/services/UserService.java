package com.mellisa.aucaregistrationsystem.services;

import com.mellisa.aucaregistrationsystem.model.Users;
import com.mellisa.aucaregistrationsystem.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public Users saveUser(Users user) {
        return userRepository.save(user);
    }

    public Optional<Users> findUserById(Long id) {
        return userRepository.findById(id);
    }

    public Optional<Users> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<Users> getAllUsers() {
        return userRepository.findAll();
    }
}
