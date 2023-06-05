package com.toolbox.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toolbox.entities.Portfolio;
import com.toolbox.services.PortfolioService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost"})
public class PortfolioController {
	
	@Autowired
	private PortfolioService portfolioService;
	
	@GetMapping(path="/portfolios")
	public List<Portfolio> getUserPortfolios(HttpServletRequest req, HttpServletResponse res, Principal principal){
		return portfolioService.getUserPortfolios(principal.getName());
		
	}

}
