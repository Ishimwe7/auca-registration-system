package com.mellisa.aucaregistrationsystem.repositories;


import com.mellisa.aucaregistrationsystem.model.PasswordResetToken;
import com.mellisa.aucaregistrationsystem.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {
    Optional<PasswordResetToken> findByToken(String token);
    Optional<PasswordResetToken> findByUser(Users user);
}
