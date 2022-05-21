package com.skilldistillery.accomplish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.UserDAO;
import com.skilldistillery.accomplish.entities.User;
import com.skilldistillery.accomplish.entities.UserChallenge;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path={"/", "home.do"})
	public String home(Model model, HttpSession session) {
		String view = "home";
		
		if(session.getAttribute("user") != null) {
			view = "views/userHome";
		}
		
		return view;
	}
	
	@RequestMapping(path="createUser.do", method = RequestMethod.GET)
	public String createUserPage() {
		return "views/register";
	}
	
	
	@RequestMapping(path= "createUser.do", method = RequestMethod.POST)
	public String createNewUser(User user, HttpSession session, RedirectAttributes redir, Integer feet, Integer inches) {
		String view = "views/userHome";
		Double height = (double)((feet * 12) + inches);
		user.setHeight(height);
		userDAO.createaUser(user);	
		
		if (user.getId() != 0) {
			session.setAttribute("user", user);
		} else {
			redir.addFlashAttribute("message", "Username is taken");
			view = "redirect:login.do";
		}
		
		return view;
	}
	
	@RequestMapping(path= "login.do")
	public String login(String username, String password, HttpSession session, RedirectAttributes redir, Model model) {
		String view = "home";
		User user = userDAO.findByUserNameAndPassword(username, password);
		if(user != null) {
			session.setAttribute("user", user);
			
			for (UserChallenge challenge : user.getUserChallenges()) {
				if(challenge.getActive()) {
					model.addAttribute("challenge", challenge);
					break;
				}
			}
			view = "views/userHome";
		} else {
			redir.addFlashAttribute("message", "Username or Password is incorrect");
		}
		return view;
	}
//	@RequestMapping(path= {"delete.do"})
//	public String deleteUser(@RequestParam("deleteId") int id) {
//		boolean user = userDAO.deleteUser(id);
//		
//		if(user == true) {
//			return "userAccountDeleted";
//		}else {
//			return "unsuccessful";
//		}
//	}
	
//	RequestMapping(path=)
}
