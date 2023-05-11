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

class BuilderTest {
	
	private Builder builder;
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
		builder=em.find(Builder.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		builder=null;
		em.close();
	}

	@Test
	void test_Builder_entity_mapping() {
		assertNotNull(builder);
		assertEquals(30.00,builder.getHourlyRate());
	}
	
	@Test
	void test_Builder_User_mapping() {
		assertNotNull(builder);
		assertEquals(2, builder.getUser().getId());
	}
	
	@Test
	void test_Builder_Specialty_mapping() {
		assertNotNull(builder);
		assertEquals(3,builder.getSpecialty().getId());
	}
	
	@Test
	void test_Builder_Customer_mapping() {
		assertNotNull(builder);
		assertEquals(1, builder.getCustomers().size());
	}
	
	@Test
	void test_Builder_Project_mapping() {
		assertNotNull(builder);
		assertEquals(1, builder.getProjects().size());
	}

}
