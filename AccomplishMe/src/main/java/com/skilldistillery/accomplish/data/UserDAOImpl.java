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
		String jpql = "SELECT u FROM User u WHERE u.username = :username";
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
	
	@Override
	public boolean deleteUser(int userId) {
		boolean isUserDeleted = false;
		User user = em.find(User.class, userId);
		if(user != null) {
			user.setActive(false);
			isUserDeleted = !user.getActive();
		}
		return isUserDeleted;
	}
	
	@Override
	public User editUser(User user) {
		int id = user.getId();
		
		User userToEdit = em.find(User.class, id);
		
		userToEdit.setUsername(user.getUsername());
		userToEdit.setPassword(user.getPassword());
		userToEdit.setHeight(user.getHeight());
		userToEdit.setWeight(user.getWeight());
		userToEdit.setFirstName(user.getFirstName());
		userToEdit.setLastName(user.getLastName());
		userToEdit.setBirthday(user.getBirthday());
		userToEdit.setUserPhoto(user.getUserPhoto());
		
		return userToEdit;
	}
	
}
