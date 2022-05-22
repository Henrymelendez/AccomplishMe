package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

@Service
@Transactional
public class ChallengeLogDAOImpl implements ChallengeLogDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public ChallengeLog createChallengeLog(ChallengeLog log) {
		em.persist(log);
		return log;
	}

	@Override
	public ChallengeLog updateChallengeLog(ChallengeLog log) {
		ChallengeLog managedLog = em.find(ChallengeLog.class, log.getId());
		
		managedLog.setChallengeLogDetails(log.getChallengeLogDetails());
		
		return managedLog;
	}

	@Override
	public boolean deleteChallengeLog(ChallengeLog log) {
		ChallengeLog managedLog = em.find(ChallengeLog.class, log.getId());
		managedLog.setActive(false);
		managedLog = em.find(ChallengeLog.class, log.getId());
		return managedLog.getActive();
	}

	@Override
	public ChallengeLog addChallengeLogDetails(ChallengeLog log, ChallengeLogDetail... details) {
		ChallengeLog managedLog = em.find(ChallengeLog.class, log.getId());
		for (ChallengeLogDetail challengeLogDetail : details) {
			managedLog.addChallengeLogDetail(challengeLogDetail);
		}
	
		return managedLog;
	}

	@Override
	public ChallengeLog createAndAddChallengeLogDetails(ChallengeLog log, ChallengeLogDetail... details) {
		for (ChallengeLogDetail challengeLogDetail : details) {
			log.addChallengeLogDetail(challengeLogDetail);
		}
		em.persist(log);
		return log;
	}
	
	
}
