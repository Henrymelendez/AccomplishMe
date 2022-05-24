package com.skilldistillery.accomplish.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeDetailDAO;
import com.skilldistillery.accomplish.data.ChallengeLogDAO;
import com.skilldistillery.accomplish.data.ChallengeLogDetailDAO;
import com.skilldistillery.accomplish.entities.ChallengeDetail;
import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

@Controller
public class ChallengeLogDetailController {
	
	
	@Autowired
	ChallengeLogDetailDAO cldDao;
	@Autowired
	ChallengeLogDAO clDao;
	@Autowired
	ChallengeDetailDAO cdDao;
	
	
	@RequestMapping(path = "addChallengeDetail.cld", method = RequestMethod.POST)
	public String addToChallengeLog(ChallengeLogDetail detail, RedirectAttributes redir, int id) {
		ChallengeLog log = clDao.findById(id);
		detail.setChallengeLog(log);
		detail.setActive(true);
		log.addChallengeLogDetail(detail);
		detail = cldDao.addLogDetail(detail);
		redir.addFlashAttribute("log",log);
		redir.addFlashAttribute("page", "Journal");
		
		return "redirect:viewLogRedirect.clc";
	}
	
	
	
	
	@RequestMapping(path="addChallengeDetail.cld", method= RequestMethod.GET)
	public String startaddToChallengeLog(Model model, String name) {
		
		List<ChallengeDetail> challengeDetails = cdDao.findByCategoryName(name);
		model.addAttribute("details", challengeDetails);
		
		
		
		return "views/createChallengeLogDetails";
	}
	
}
