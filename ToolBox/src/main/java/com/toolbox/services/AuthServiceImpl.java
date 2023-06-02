package com.toolbox.services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.toolbox.entities.User;
import com.toolbox.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {

	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private UserRepository userRepo;
	

	@Override
	public User register(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserByUsername(String username) {
		return userRepo.findByUsername(username);
	}

}
