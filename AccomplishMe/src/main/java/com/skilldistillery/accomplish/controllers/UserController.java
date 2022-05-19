package com.skilldistillery.accomplish.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.accomplish.data.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	

}
