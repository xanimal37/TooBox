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

class BuildingMaterialTest {

	private BuildingMaterial buildingMaterial;
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
		buildingMaterial=em.find(BuildingMaterial.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		buildingMaterial=null;
		em.close();
	}

	@Test
	void test_BuildingMaterial_entity_mapping() {
		assertNotNull(buildingMaterial);
	}

}
