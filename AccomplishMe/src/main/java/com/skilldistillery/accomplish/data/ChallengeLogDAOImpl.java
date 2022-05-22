package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.ChallengeLog;

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
		managedLog.setEntryDate(log.getEntryDate());
		managedLog.setUserChallenge(log.getUserChallenge());
		
		return managedLog;
	}

	@Override
	public boolean deleteChallengeLog(ChallengeLog log) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
