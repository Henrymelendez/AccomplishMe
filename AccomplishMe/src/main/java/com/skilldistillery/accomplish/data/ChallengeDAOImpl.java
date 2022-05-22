package com.skilldistillery.accomplish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContexts;
import javax.transaction.Transactional;

import org.aspectj.apache.bcel.generic.BranchHandle;
import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.Challenge;

@Service
@Transactional
public class ChallengeDAOImpl implements ChallengeDAO {
	
	@PersistenceContext
	EntityManager em;
	

	@Override
	public Challenge findById(int UsedId) {
		
		return em.find(Challenge.class, UsedId);
	}

	@Override
	public Challenge createChallenge(Challenge challenge) {
		String jpql = "SELECT name FROM Challenge";
		List<String> existingChallenges = em.createQuery(jpql, String.class).getResultList();
		boolean currentChallenge = true;
		for (String name : existingChallenges) {
			if(challenge.getName().equalsIgnoreCase(name)) {
				currentChallenge = false;
			}
			
		}
		if(currentChallenge) {
			em.persist(challenge);
		}
		return challenge;
	}

	@Override
	public boolean deleteChallenge(int challengeId) {
		boolean challengeDeleted = false;
		Challenge challenge = em.find(Challenge.class, challengeDeleted);
		if(challenge !=null) {
			challenge.setActive(false);
			challengeDeleted = !challenge.getActive();
		}
		return challengeDeleted;
	}

	@Override
	public Challenge editChallenge(Challenge challenge) {
		int id = challenge.getId();
		
		Challenge challengeToEdit = em.find(Challenge.class, id);
		
		challengeToEdit.setName(challenge.getName());
		challengeToEdit.setDescription(challenge.getDescription());
		challengeToEdit.setDuration(challenge.getDuration());
		challengeToEdit.setActive(challenge.getActive());
		
		
		
		
		return challengeToEdit;
	}

	@Override
	public List<Challenge> findAll() {
		String jpql = "SELECT u FROM Challenge u";
		List<Challenge> challenges = em.createQuery(jpql, Challenge.class)
				.getResultList();
		
		if(challenges != null) {
			return challenges;
			
		} else {
			
			return null;
		}
		
	}
	
	
	
	
	
	
	

}
