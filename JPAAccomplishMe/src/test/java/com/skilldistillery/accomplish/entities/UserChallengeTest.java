package com.skilldistillery.accomplish.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserChallengeChallengeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserChallenge challenges;

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
		challenges = em.find(UserChallenge.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		challenges = null;
	}

	@Test
	@DisplayName("Test UserChallenge Mapping")
	void test_challenges_mappping() {
		assertNotNull(challenges);
		assertEquals("\'no details\'", challenges.getDetails());
	}
	
	@Test
	@DisplayName("Test UserChallenge Challenge mapping")
	void test_challenges_cahllange_mapping() {
		
		assertNotNull(challenges);
		assertNotNull(challenges.getUser());
		assertTrue(challenges.getUser().getFirstName().equals("Mason"));
		
	}
	
}
