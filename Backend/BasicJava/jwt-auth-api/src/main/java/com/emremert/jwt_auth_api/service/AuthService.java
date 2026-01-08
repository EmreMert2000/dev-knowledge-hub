package com.emremert.jwt_auth_api.service;

import com.emremert.jwt_auth_api.entity.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.emremert.jwt_auth_api.dto.RegisterRequest;
import com.emremert.jwt_auth_api.entity.Role;
import com.emremert.jwt_auth_api.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {
    
    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    public String register(RegisterRequest request) {
       if (userRepository.existsByUsername(request.getUsername())) {
            throw new IllegalArgumentException("Username is already taken");
       } 

       if (userRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("Email is already in use");
       }

       User user=new User();
       user.setUsername(request.getUsername());
         user.setEmail(request.getEmail());
         user.setPassword(passwordEncoder.encode(request.getPassword()));
         user.setRole(Role.USER);

         userRepository.save(user);

         return "User registered successfully";
    }
}
