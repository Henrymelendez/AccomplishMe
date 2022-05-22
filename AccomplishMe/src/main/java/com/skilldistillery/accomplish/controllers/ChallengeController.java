package com.skilldistillery.accomplish.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping(path = "createChallenge.ch", method = RequestMethod.GET)
	public String createChallengePage(Model model) {
		List<Challenge> challenges = challengeDAO.findAll();
		model.addAttribute("challenges", challenges);
		
		return "views/editChallenge";
	}
	
	
	@RequestMapping(path= "createChallenge.ch", method = RequestMethod.POST)
	public String createChallenge(Challenge challenge ) {
		String view = "";
		challengeDAO.createChallenge(challenge);
		
		
		return "";
	}
	
	@RequestMapping(path = "deleteChallenge.ch", method = RequestMethod.POST)
	public String deleteChallenge(int id) {
		boolean challenge = challengeDAO.deleteChallenge(id);
		
		if(challenge == true) {
			return "Challenge Deleted";
		}
		else {
			
				return "Unsuccessful";
		}
		
	}
	
	@RequestMapping(path = "editChallenge.ch", method = RequestMethod.GET)
	public ModelAndView startEditChallenge(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		if(user !=null) {
			mv.addObject("user", user);
			mv.setViewName("views/editChallenge");
		}else {
			mv.setViewName("redirect:home.do");
		}
		
		return mv;
		
	}
	
	
	
	@RequestMapping(path= "editChallenge.ch", method = RequestMethod.POST)
	public ModelAndView editChallenge(Challenge challenge, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Challenge added = challengeDAO.editChallenge(challenge);
		session.setAttribute("challenge", added);
		mv.setViewName("views/FIXME");
		return mv;
	}
	
	
	
	
}
