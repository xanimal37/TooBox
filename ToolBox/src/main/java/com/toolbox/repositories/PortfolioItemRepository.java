package com.toolbox.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.toolbox.entities.PortfolioItem;

public interface PortfolioItemRepository extends JpaRepository<PortfolioItem,Integer> {
	
	List <PortfolioItem> findByPortfolio_Id(int id);

}
