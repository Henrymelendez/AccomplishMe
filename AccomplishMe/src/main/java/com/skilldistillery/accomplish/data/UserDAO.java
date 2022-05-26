package com.skilldistillery.accomplish.data;

import java.util.List;

import com.skilldistillery.accomplish.entities.User;

public interface UserDAO {
	
	
	User findById(int userId);
	User findByUserNameAndPassword(String username, String password);
	User createaUser(User user);
	boolean deleteUser(int userId);
	User editUser(User user);
	User editUsernamePassword(User user);
	List<User> findByFirstAndLastName(String name);
	User addPhoto(User user);

}
