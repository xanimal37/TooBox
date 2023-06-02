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

class UserTest {
	
	private User user;
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
		em = emf.createEntityManager();
		user = em.find(User.class,2);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em.close();
	}
	
	@Test 
	void test_entity_mapping_User(){
		assertNotNull(user);
		assertEquals("xanimal37",user.getUsername());
	}

	@Test
	void test_User_Specialty_mapping() {
		assertNotNull(user);
		assertEquals(4,user.getSpecialty().getId());
		
	}
	
	@Test 
	void test_User_Projects_mapping(){
		assertNotNull(user);
		assertEquals(1,user.getProjects().size());
	}
	
	@Test
	void test_User_Portfolios_mapping(){
		assertNotNull(user);
		assertEquals(2,user.getPortfolios().size());
	}
	

}
