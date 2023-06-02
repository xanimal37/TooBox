package com.toolbox.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toolbox.entities.Portfolio;
import com.toolbox.repositories.PortfolioRepository;

@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioRepository portfolioRepository;

	@Override
	public Portfolio getUserPortfolio(String username) {
		return portfolioRepository.findByUser_Username(username);
	}

}
