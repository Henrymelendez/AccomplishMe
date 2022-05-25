package com.skilldistillery.accomplish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.ChallengeDetail;


@Service
@Transactional
public class ChallengeDetailDAOImpl implements ChallengeDetailDAO {
	@PersistenceContext
	EntityManager em;

	@Override
	public List<ChallengeDetail> findByCategoryName(String name) {
		String jpql = "SELECT c FROM ChallengeDetail c WHERE c.category.name = :name";
		
		List<ChallengeDetail> chll = em.createQuery(jpql, ChallengeDetail.class)
		.setParameter("name", name)
		.getResultList();
		
		
		
		return chll;
	}

	@Override
	public ChallengeDetail addDetail(ChallengeDetail detail) {
		em.persist(detail);
		return detail;
	}

	@Override
	public ChallengeDetail editDetail(ChallengeDetail detail) {
		ChallengeDetail managed = em.find(ChallengeDetail.class, detail.getId());
		
		if(managed != null) {
		managed.setCalories(detail.getCalories());
		managed.setDescription(detail.getDescription());
		managed.setName(detail.getName());
		managed.setNumberPages(detail.getNumberPages());
		managed.setMet(detail.getMet());
		}
		
		return managed;
	}

	@Override
	public ChallengeDetail removeDetail(ChallengeDetail detail) {
		ChallengeDetail managed = em.find(ChallengeDetail.class, detail.getId());
		
		managed.setActive(false);
		
		return managed;
	}

	@Override
	public ChallengeDetail findbyId(int id) {
		return em.find(ChallengeDetail.class, id);
	}

}
