package com.skilldistillery.accomplish.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeLogDAO;
import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

@Controller
public class ChallengeLogController {
	@Autowired
	ChallengeLogDAO logDao;

	
	@RequestMapping(path="FIXME", method= RequestMethod.POST)
	public String addLog(ChallengeLog log, RedirectAttributes redir, ChallengeLogDetail... detals) {
		
		log = logDao.createAndAddChallengeLogDetails(log, detals);
		
		
		return "redirect:FIXMEVIEWLOG.do";
	}
	
	
	
}
