package com.toolbox.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toolbox.entities.Portfolio;
import com.toolbox.repositories.PortfolioRepository;

@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioRepository portfolioRepo;

	@Override
	public List<Portfolio> getUserPortfolios(String username) {
		return portfolioRepo.findByUser_Username(username);
	}

	

}
