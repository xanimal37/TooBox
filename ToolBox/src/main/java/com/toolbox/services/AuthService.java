package com.toolbox.services;

import com.toolbox.entities.User;

public interface AuthService {

	public User register(User user);
	public User getUserByUsername(String username);
}
