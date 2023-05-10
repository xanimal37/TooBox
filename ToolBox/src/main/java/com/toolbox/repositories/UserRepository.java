package com.toolbox.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.toolbox.entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User findByUsername(String username);
	
}
