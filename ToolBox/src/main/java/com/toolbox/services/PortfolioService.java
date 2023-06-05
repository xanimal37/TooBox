package com.toolbox.services;

import java.util.List;

import com.toolbox.entities.Portfolio;

public interface PortfolioService {

	public List<Portfolio> getUserPortfolios(String username);
}
