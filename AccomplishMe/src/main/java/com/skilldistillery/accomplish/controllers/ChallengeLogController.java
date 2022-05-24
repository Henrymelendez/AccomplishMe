package com.skilldistillery.accomplish.controllers;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.ChallengeLogDAO;
import com.skilldistillery.accomplish.entities.Category;
import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;
import com.skilldistillery.accomplish.entities.User;
import com.skilldistillery.accomplish.entities.UserChallenge;

@Controller
public class ChallengeLogController {
	@Autowired
	ChallengeLogDAO logDao;

	@RequestMapping(path = "viewLog.do", method = RequestMethod.GET)
	public String viewLog(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		ChallengeLog log = null;
		if (user != null && user.getCurrentUserChallenge() != null
				&& user.getCurrentUserChallenge().getMostRecent() != null) {

			log = user.getCurrentUserChallenge().getMostRecent();
		}

		model.addAttribute("log", log);
		model.addAttribute("page", "Journal");
		return "views/viewLog";
	}

	@RequestMapping(path = "addlog.clc", method = RequestMethod.POST)
	public String addLog(ChallengeLog log, RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		UserChallenge uChallenge = user.getCurrentUserChallenge();
		
		
		if (uChallenge.getMostRecent() == null || !uChallenge.getMostRecent().getEntryDate().equals(LocalDate.now())) {
			log.setEntryDate(LocalDate.now());
			log.setUserChallenge(user.getCurrentUserChallenge());
			log.setActive(true);
			log = logDao.createChallengeLog(log);
			
			uChallenge.setMostRecent(log);
			session.setAttribute("user", user);
		} else {
			log = user.getCurrentUserChallenge().getMostRecent();
		}
		redir.addFlashAttribute(log);
		for (Category cat : uChallenge.getChallenge().getCategories()) {
			redir.addFlashAttribute(cat.getName().toLowerCase(), cat);
		}

		return "redirect:viewLogRedirect.clc";
	}
	
	@RequestMapping(path="viewLogRedirect.clc")
	public String viewLogRedirect() {
		return "views/viewLog";
	}

	public String editEntireLog(ChallengeLog log, RedirectAttributes redir, ChallengeLogDetail... details) {
		List<ChallengeLogDetail> listDetails = Arrays.asList(details);
		log.setChallengeLogDetails(listDetails);
		log = logDao.updateChallengeLog(log);

		return "redirect:FIXMEVIEWLOG.do";
	}

}
