package com.toolbox.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toolbox.entities.PortfolioItem;
import com.toolbox.repositories.PortfolioItemRepository;

@Service
public class PortfolioItemServiceImpl implements PortfolioItemService {
	
	@Autowired
	private PortfolioItemRepository portfolioItemRepo;

	@Override
	public List<PortfolioItem> getPortfolioItems(int id) {
		return portfolioItemRepo.findByPortfolio_Id(id);
	}

}
