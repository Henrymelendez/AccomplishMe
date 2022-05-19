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
	
	@RequestMapping(path={"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("DEBUG", userDAO.findById(1)); //DEBUG REMOVE LATER
		return "home";
	}

}
