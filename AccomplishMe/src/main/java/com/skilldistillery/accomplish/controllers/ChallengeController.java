package com.skilldistillery.accomplish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.accomplish.data.ChallengeDAO;
import com.skilldistillery.accomplish.entities.Challenge;

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
	
}
