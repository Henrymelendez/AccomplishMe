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
	private UserChallenge userChallenge;

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
		userChallenge = em.find(UserChallenge.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userChallenge = null;
	}

	@Test
	@DisplayName("Test UserChallenge Mapping")
	void test_challenges_mappping() {
		assertNotNull(userChallenge);
		assertEquals("\'no details\'", userChallenge.getDetails());
	}
	
	@Test
	@DisplayName("Test UserChallenge user mapping")
	void test_userChallenge_user_mapping() {
		
		assertNotNull(userChallenge);
		assertNotNull(userChallenge.getUser());
		assertTrue(userChallenge.getUser().getFirstName().equals("Mason"));
		
	}
	
	@Test
	@DisplayName("Test UserChallenge Challenge mapping")
	void test_challenges_challenge_mapping(){
		assertNotNull(userChallenge);
		assertNotNull(userChallenge.getChallenge());
		assertTrue(userChallenge.getChallenge().getName().equals("75 hard"));
	}
	
	@Test
	@DisplayName("Test UserChallenge Challenge Logs Mapping")
	void test_userchallenge_challengeLogs() {
		assertNotNull(userChallenge);
		assertNotNull(userChallenge.getChallengeLogs());
		assertTrue(userChallenge.getChallengeLogs().size() > 0);
	}
	
}
