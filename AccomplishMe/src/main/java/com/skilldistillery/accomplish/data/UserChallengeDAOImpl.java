package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.Challenge;
import com.skilldistillery.accomplish.entities.UserChallenge;

@Service
@Transactional
public class UserChallengeDAOImpl implements UserChallengeDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public UserChallenge createUserChallengeExistingChallenge(UserChallenge uChallenge) {
		em.persist(uChallenge);
		return uChallenge;
	}

	@Override
	public UserChallenge updateUserChallenge(UserChallenge uChallenge) {
		UserChallenge managedUChallenge = em.find(UserChallenge.class, uChallenge.getId());
		
		managedUChallenge.setDetails(uChallenge.getDetails());
		managedUChallenge.setStartDate(uChallenge.getStartDate());
		managedUChallenge.setEndDate(uChallenge.getEndDate());
		
		return managedUChallenge;
	}

	@Override
	public boolean deleteUserChallenge(UserChallenge uChallenge) {
		UserChallenge managedUChallenge = em.find(UserChallenge.class, uChallenge.getId());
		
		managedUChallenge.setActive(false);
		
		return !managedUChallenge.getActive();
	}

	@Override
	public UserChallenge createUserChallengeNewChallenge(UserChallenge uChallenge, Challenge challenge) {
		em.persist(challenge);
		em.persist(uChallenge);
		return uChallenge;
	}

	@Override
	public UserChallenge completeUserChallenge(UserChallenge uChallenge) {
		UserChallenge managedUChallenge = em.find(UserChallenge.class, uChallenge.getId());
		managedUChallenge.setComplete(true);
		managedUChallenge.setInProgress(false);
		return managedUChallenge;
	}

	@Override
	public UserChallenge abandonUserChallenge(UserChallenge uChallenge) {
		UserChallenge managedUChallenge = em.find(UserChallenge.class, uChallenge.getId());
		managedUChallenge.setComplete(false);
		managedUChallenge.setInProgress(false);
		return managedUChallenge;
	}

}
