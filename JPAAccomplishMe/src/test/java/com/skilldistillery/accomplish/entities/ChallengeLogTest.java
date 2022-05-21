package com.skilldistillery.accomplish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ChallengeLogTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ChallengeLog challengeLog;

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
		challengeLog = em.find(ChallengeLog.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		challengeLog = null;
	}

	@Test
	@DisplayName("Test ChallengeLog Mapping")
	void test_challengeLog_mappping() {
		assertNotNull(challengeLog);
		LocalDate testDate = LocalDate.of(2022, Month.MAY, 20);
		assertEquals(testDate, challengeLog.getEntryDate());
	}
	
	@Test
	@DisplayName("Test ChallengeLog UserChallenge Mapping")
	void test_UserChallenge() {
		assertNotNull(challengeLog);
		assertNotNull(challengeLog.getUserChallenge());
		assertEquals("\'no details\'", challengeLog.getUserChallenge().getDetails());
		
	}
	
	@Test
	@DisplayName("Test ChallengeLog Details Mapping")
	void test_challengeLogDetails() {
		assertNotNull(challengeLog);
		assertNotNull(challengeLog.getChallengeLogDetails());
		assertTrue(challengeLog.getChallengeLogDetails().size() > 0);
	}

	
}
