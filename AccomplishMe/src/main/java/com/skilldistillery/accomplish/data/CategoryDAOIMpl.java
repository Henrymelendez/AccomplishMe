package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.Category;

@Service
@Transactional
public class CategoryDAOIMpl implements CategoryDAO {
	@PersistenceContext
	EntityManager em;

	@Override
	public Category findByName(String name) {
		String jpql = "SELECT c FROM Category c WHERE c.name = :name";
		Category cat = em.createQuery(jpql, Category.class)
		.setParameter("name", name)
		.getSingleResult();
		
		return cat;
	}

}
