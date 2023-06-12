package com.toolbox.services;

import java.util.List;

import com.toolbox.entities.PortfolioItem;

public interface PortfolioItemService {
	
	List<PortfolioItem> getPortfolioItems(int id);

}
