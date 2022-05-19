package com.skilldistillery.accomplish.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.accomplish.entities.User;

import net.bytebuddy.matcher.ElementMatcher;


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
		// TODO Auto-generated method stub
		return null;
	}
	
	
	

}
