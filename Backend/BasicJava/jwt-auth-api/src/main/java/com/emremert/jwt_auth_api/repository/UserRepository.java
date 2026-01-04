package com.emremert.jwt_auth_api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.emremert.jwt_auth_api.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
   Optional<User> findByUsername(String username);

   Boolean existsByUsername(String username);

   Boolean existsByEmail(String email);
}
