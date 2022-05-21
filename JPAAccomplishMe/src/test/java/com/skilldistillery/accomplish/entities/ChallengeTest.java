package com.skilldistillery.accomplish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ChallengeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Challenge challenge;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAAccomplishMe");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		challenge = em.find(Challenge.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		challenge = null;
	}

	@Test
	@DisplayName("Test Challenge Mapping")
	void test_challenge_mappping() {
		assertNotNull(challenge);
		assertEquals("NaNoWriMo", challenge.getName());
	}


	@Test
	@DisplayName("Test creator mapping")
	void test_created_challenge_mapping() {
		challenge = em.find(Challenge.class, 1);
		assertNotNull(challenge);
		assertNotNull(challenge.getCreator());
		assertTrue(challenge.getCreator().getUsername().equals("admin"));
	}
	
	@Test
	@DisplayName("Test challeng category mapping")
	void test_challenge_category_mapping() {
		assertNotNull(challenge);
		assertNotNull(challenge.getCategories());
		assertTrue(challenge.getCategories().size() > 0);
	}
}
