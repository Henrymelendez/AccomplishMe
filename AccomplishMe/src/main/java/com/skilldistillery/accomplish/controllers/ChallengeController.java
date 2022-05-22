package com.skilldistillery.accomplish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeDAO;
import com.skilldistillery.accomplish.entities.Challenge;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class ChallengeController {
	@Autowired
	ChallengeDAO challengeDAO;
	
	
	@RequestMapping(path = "createChallenge.do", method = RequestMethod.GET)
	public String createChallengePage() {
		
		
		return "";
	}
	
	
	@RequestMapping(path= "createChallenge.do", method = RequestMethod.GET)
	public String createChallenge(Challenge challenge ) {
		String view = "";
		challengeDAO.createChallenge(challenge);
		
		
		return "";
	}
	
	@RequestMapping(path = "deleteChallenge.do", method = RequestMethod.POST)
	public String deleteChallenge(int id) {
		boolean challenge = challengeDAO.deleteChallenge(id);
		
		if(challenge == true) {
			return "Challenge Deleted";
		}
		else {
			
				return "Unsuccessful";
		}
		
	}
	
	@RequestMapping(path = "editChallenge.do", method = RequestMethod.GET)
	public ModelAndView startEditChallenge(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		if(user !=null) {
			mv.addObject("user", user);
			mv.setViewName("views/FIXME");
		}else {
			mv.setViewName("redirect:home.do");
		}
		
		return mv;
		
	}
	
	
	
	
	
	
	
	
}
