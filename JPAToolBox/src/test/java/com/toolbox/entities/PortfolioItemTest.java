package com.toolbox.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PortfolioItemTest {

	private PortfolioItem portfolioItem;
	private static EntityManagerFactory emf;
	private EntityManager em;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAToolBox");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em=emf.createEntityManager();
		portfolioItem = em.find(PortfolioItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		portfolioItem=null;
		em.close();
	}

	@Test
	void test_PortfolioItem_entity_mapping() {
		assertNotNull(portfolioItem);
	}

}
