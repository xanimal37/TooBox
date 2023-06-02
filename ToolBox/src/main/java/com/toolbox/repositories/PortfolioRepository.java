package com.toolbox.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.toolbox.entities.Portfolio;

public interface PortfolioRepository extends JpaRepository<Portfolio,Integer>{

	Portfolio findByUser_Username(String username);
}
