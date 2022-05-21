package com.skilldistillery.accomplish.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.accomplish.data.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path={"/", "login.do"})
	public String home(Model model) {
		
		
		return "home";
	}

}
