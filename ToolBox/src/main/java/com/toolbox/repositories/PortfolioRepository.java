package com.toolbox.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.toolbox.entities.Portfolio;

public interface PortfolioRepository extends JpaRepository<Portfolio,Integer>{

	List<Portfolio> findByUser_Username(String username);
}
