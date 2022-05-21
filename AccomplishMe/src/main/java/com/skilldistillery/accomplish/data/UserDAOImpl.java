package com.skilldistillery.accomplish.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User findByUserNameAndPassword(String username, String password) {
		String jpql = "SELECT * FROM user WHERE username = :username";
		User user = em.createQuery(jpql, User.class).setParameter("username", username).getSingleResult();
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}

		return null;
	}

	@Override
	public User createaUser(User user) {
		String jpql = "SELECT username FROM user";
		List<String> existingUsernames = em.createQuery(jpql, String.class).getResultList();
		boolean freeName = true;
		for (String username : existingUsernames) {
			if (user.getUsername().equals(username)) {
				freeName = false;
			}
		}
		if (freeName) {
			em.persist(user);
		}

		return user;
	}

}
