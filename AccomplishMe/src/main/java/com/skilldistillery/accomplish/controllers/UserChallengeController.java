package com.skilldistillery.accomplish.controllers;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeDAO;
import com.skilldistillery.accomplish.data.UserChallengeDAO;
import com.skilldistillery.accomplish.entities.Challenge;
import com.skilldistillery.accomplish.entities.User;
import com.skilldistillery.accomplish.entities.UserChallenge;

@Controller
public class UserChallengeController {

	@Autowired
	private UserChallengeDAO ucDao;
	
	@Autowired
	private ChallengeDAO cDao;
	
	@RequestMapping(path="selectChallenge.uch", method = RequestMethod.GET)
	public String startChallenge(int id, HttpSession session) {
		Challenge challenge = cDao.findById(id);
		session.setAttribute("challenge", challenge);
		
		
		return "views/startChallenge";
	}
	
	
	@RequestMapping(path="selectChallenge.uch", method= RequestMethod.POST)
	public String startUserChallenge(String details, RedirectAttributes redir, HttpSession session) {
		User user = (User)session.getAttribute("user");
		Challenge challenge = (Challenge)session.getAttribute("challenge");
		UserChallenge uChallenge = new UserChallenge();

//		abandon or complete inProgress UserChallenges		
		for (UserChallenge userChallenge : user.getUserChallenges()) {
			if(userChallenge.getInProgress() && userChallenge.getEndDate() != LocalDate.now()) {
				ucDao.abandonUserChallenge(userChallenge);
			} else if(userChallenge.getInProgress() && userChallenge.getEndDate().equals(LocalDate.now())) {
				ucDao.completeUserChallenge(userChallenge);
			}
				
		}	
		
//		set new UserChallenge attributes
		uChallenge.setUser(user);
		uChallenge.setChallenge(challenge);
		uChallenge.setStartDate(LocalDate.now());
		uChallenge.setDetails(details);
		uChallenge.setEndDate(LocalDate.now().plusDays(challenge.getDuration()));
		uChallenge.setActive(true);
		uChallenge.setComplete(false);
		uChallenge.setInProgress(true);
		
//		send new UserChallenge to DAO
		ucDao.createUserChallengeExistingChallenge(uChallenge);
		
//		adjust current user entity
		user.addUserChallenge(uChallenge);
		user.setCurrentUserChallenge(uChallenge);
		
//		Set attributes for next display
		session.setAttribute("user", user);
		redir.addFlashAttribute("message", "you have started the " + challenge.getName() + " challenge!");
		
		return "redirect:loginRedirect.do";
	}
	
	
	
}
