package com.skilldistillery.accomplish.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ChallengeDetailTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ChallengeDetail challengeDetail;

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
		challengeDetail = em.find(ChallengeDetail.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		challengeDetail = null;
	}

	@Test
	@DisplayName("Test ChallengeDetail Mapping")
	void test_challengeDetail_mappping() {
		assertNotNull(challengeDetail);
		assertEquals("Swimming (freestyle)", challengeDetail.getName());
	}

	
}
