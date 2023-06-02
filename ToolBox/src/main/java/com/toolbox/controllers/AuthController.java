package com.toolbox.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toolbox.entities.User;
import com.toolbox.services.AuthService;


@RestController
@CrossOrigin({"*", "http://localhost"})
public class AuthController {
	
	@Autowired
	private AuthService authService;
	
	@GetMapping("authenticate")
	public User authenticate(Principal principal, HttpServletResponse res) {
		if(principal==null) { //no authorization header sent
			res.setStatus(401);
			res.setHeader("WWW-Authenticate", "Basic");
			
			return null;
		}
	return authService.getUserByUsername(principal.getName());
		
		
	}

}
