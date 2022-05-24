package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

@Service
@Transactional
public class ChallengeLogDetailDAOImpl implements ChallengeLogDetailDAO {
	@PersistenceContext
	EntityManager em;

	@Override
	public ChallengeLogDetail addLogDetail(ChallengeLogDetail logDetail) {
		
		em.persist(logDetail);
		
		return logDetail;
	}

	@Override
	public ChallengeLogDetail editLogDetail(ChallengeLogDetail logDetail) {
		ChallengeLogDetail managed =  em.find(ChallengeLogDetail.class, logDetail.getId());
		
		managed.setDuration(logDetail.getDuration());
		managed.setServings(logDetail.getServings());
		managed.setPagesRead(logDetail.getPagesRead());
		
		return managed;
	}

	@Override
	public boolean removeLogDetail(ChallengeLogDetail logDetail) {
		ChallengeLogDetail managed =  em.find(ChallengeLogDetail.class, logDetail.getId());
		managed.setActive(false);
		
		return !managed.getActive();
	}

}
