package com.skilldistillery.accomplish.controllers;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeLogDAO;
import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class ChallengeLogController {
	@Autowired
	ChallengeLogDAO logDao;

	
	@RequestMapping(path="FIXME", method= RequestMethod.POST)
	public String addLog(ChallengeLog log, RedirectAttributes redir, HttpSession session, ChallengeLogDetail... detals) {
		User user = (User) session.getAttribute("user");
		log.setUserChallenge(user.getCurrentUserChallenge());
		log = logDao.createAndAddChallengeLogDetails(log, detals);
		redir.addFlashAttribute(log);
		
		return "redirect:FIXMEVIEWLOG.do";
	}
	
	public String editEntireLog(ChallengeLog log, RedirectAttributes redir, ChallengeLogDetail... details) {
		List<ChallengeLogDetail> listDetails = Arrays.asList(details);
		log.setChallengeLogDetails(listDetails);
		log = logDao.updateChallengeLog(log);
		
		
		return "redirect:FIXMEVIEWLOG.do";
	}
	
	
	
}
