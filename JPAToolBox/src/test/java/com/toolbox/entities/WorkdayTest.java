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

class WorkdayTest {
	
	private Workday workday;
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
		workday = em.find(Workday.class,2);
	}

	@AfterEach
	void tearDown() throws Exception {
		workday=null;
		em.close();
	}

	@Test
	void test_Workday_mapping() {
		assertNotNull(workday);
		assertEquals("ran out of paint",workday.getNote());
	}
	
	@Test
	void test_Workday_Project_mapping() {
		assertNotNull(workday);
		assertEquals(2,workday.getProject().getId());
	}

}
