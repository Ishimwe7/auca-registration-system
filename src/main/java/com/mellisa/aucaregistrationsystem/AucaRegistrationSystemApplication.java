package com.mellisa.aucaregistrationsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ServletComponentScan
@EnableJpaRepositories(basePackages = "com.mellisa.aucaregistrationsystem.repositories")
@EnableTransactionManagement
@SpringBootApplication
public class AucaRegistrationSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(AucaRegistrationSystemApplication.class, args);
	}

}
