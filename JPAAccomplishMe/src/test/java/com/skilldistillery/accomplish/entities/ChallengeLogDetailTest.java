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

class ChallengeLogDetailTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ChallengeLogDetail challengeLogDetail;

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
		challengeLogDetail = em.find(ChallengeLogDetail.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		challengeLogDetail = null;
	}

	@Test
	@DisplayName("Test ChallengeLogDetail Mapping")
	void test_challengeLogDetail_mappping() {
		assertNotNull(challengeLogDetail);
		assertEquals(45, challengeLogDetail.getDuration());
	}
	@Test
	@DisplayName("Test ChallengeLog Mapping")
	void test_challengeLog() {
		LocalDate testDate = LocalDate.of(2022, Month.MAY, 20);
		assertNotNull(challengeLogDetail);
		assertNotNull(challengeLogDetail.getChallengeLog());
		assertEquals(testDate, challengeLogDetail.getChallengeLog().getEntryDate());
		
	}
	
	@Test
	@DisplayName("Test Detail Mapping")
	void test_challengeLogDetail() {
		assertNotNull(challengeLogDetail);
		assertNotNull(challengeLogDetail.getChallengeDetail());
		assertTrue(challengeLogDetail.getChallengeDetail().getName().equals("Swimming (freestyle)"));
	}

	
}
