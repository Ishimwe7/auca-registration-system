package com.mellisa.aucaregistrationsystem.services;

import com.mellisa.aucaregistrationsystem.model.PasswordResetToken;
import com.mellisa.aucaregistrationsystem.model.Users;
import com.mellisa.aucaregistrationsystem.repositories.PasswordResetTokenRepository;
import com.mellisa.aucaregistrationsystem.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordResetTokenRepository tokenRepository;

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

    @Autowired
    private JavaMailSender mailSender;

    public boolean sendResetPasswordEmail(String email) {
        Optional<Users> user = userRepository.findByEmail(email);
        if (user != null) {
            // Generate token (consider using UUID or JWT)
            String token = UUID.randomUUID().toString();
            PasswordResetToken passwordResetToken = new PasswordResetToken();
            passwordResetToken.setToken(token);
            passwordResetToken.setUser(user.get());
            passwordResetToken.setExpiryDate(LocalDateTime.now().plusHours(1));

            tokenRepository.save(passwordResetToken);

            String resetLink = "http://localhost:8080/reset-password?token=" + token;

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Password Reset Request");
            message.setText("To reset your password, click the link below:\n" + resetLink);
            mailSender.send(message);
            return true;
        }
        return false;
    }

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public boolean validatePasswordResetToken(String token) {
        Optional<PasswordResetToken> optionalToken = tokenRepository.findByToken(token);
        if (optionalToken.isPresent()) {
            PasswordResetToken passwordResetToken = optionalToken.get();
            return LocalDateTime.now().isBefore(passwordResetToken.getExpiryDate());
        }
        return false;
    }

    public boolean resetPassword(String token, String newPassword) {
        Optional<PasswordResetToken> optionalToken = tokenRepository.findByToken(token);
        if (optionalToken.isPresent()) {
            PasswordResetToken passwordResetToken = optionalToken.get();
            Users user = passwordResetToken.getUser();
            user.setPassword(passwordEncoder.encode(newPassword));
            userRepository.save(user);
            tokenRepository.delete(passwordResetToken);
            return true;
        }
        return false;
    }
}

