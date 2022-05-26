package com.skilldistillery.accomplish.controllers;

import java.time.LocalDate;
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
import com.skilldistillery.accomplish.entities.User;
import com.skilldistillery.accomplish.entities.UserChallenge;

@Controller
public class ChallengeLogController {
	@Autowired
	ChallengeLogDAO logDao;
	

	@RequestMapping(path = "viewLog.do", method = RequestMethod.GET)
	public String viewLog(HttpSession session, Model model, RedirectAttributes redir) {
		String view = "views/viewLog";
		User user = (User) session.getAttribute("user");
		ChallengeLog log = null;
		if (user.getCurrentUserChallenge() == null){
			view = "redirect:findChallenges.ch";
		}
		if (user != null && user.getCurrentUserChallenge() != null
				&& user.getCurrentUserChallenge().getMostRecent() != null) {

			log = user.getCurrentUserChallenge().getMostRecent();
			
			for (Category cat : user.getCurrentUserChallenge().getChallenge().getCategories()) {
				session.setAttribute(cat.getName().toLowerCase(), cat);
			}
		}

		model.addAttribute("log", log);
		model.addAttribute("page", "Journal");
		return view;
	}

	@RequestMapping(path = "addlog.clc", method = RequestMethod.POST)
	public String addLog(ChallengeLog log, RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		UserChallenge uChallenge = user.getCurrentUserChallenge();
		
//		Check if there is already an entry for today
		if (uChallenge.getMostRecent() == null || !uChallenge.getMostRecent().getEntryDate().equals(LocalDate.now())) {
//		Create entry if there is not	
			log.setEntryDate(LocalDate.now());
			log.setUserChallenge(user.getCurrentUserChallenge());
			log.setActive(true);
			log = logDao.createChallengeLog(log);

//		Update "most recent"
			uChallenge.setMostRecent(log);
//		Update user in session
		} else {
//		Assign to current entry
			log = user.getCurrentUserChallenge().getMostRecent();
		}
		
		user.getCurrentUserChallenge().addChallengeLog(log);
		session.setAttribute("user", user);
		
//		add log to model
		redir.addFlashAttribute("log", log);
		
		for (Category cat : uChallenge.getChallenge().getCategories()) {
			session.setAttribute(cat.getName().toLowerCase(), cat);
		}

		return "redirect:viewLogRedirect.clc";
	}
	
	@RequestMapping(path="viewLogRedirect.clc")
	public String viewLogRedirect() {
		return "views/viewLog";
	}
	
	
	
	@RequestMapping(path="deletelog.clc", method=RequestMethod.POST)
	public String deleteEntry(ChallengeLog log, RedirectAttributes redir, HttpSession session) {
		String view = "redirect:viewLogRedirect.clc";
		User user = (User) session.getAttribute("user");
		logDao.deleteChallengeLog(log);
		
		user.findLogById(log.getId()).setActive(false);
		user.getCurrentUserChallenge().setMostRecent(null);
		session.setAttribute("user", user);
		
		return view;
		
	}
	
	@RequestMapping(path = "viewLogById.clc", method = RequestMethod.GET)
	public String viewLogById(int id, Model model, HttpSession session) {
		ChallengeLog log = logDao.findById(id);
		
		model.addAttribute("log", log );
		model.addAttribute("page", "Journal");
		for (Category cat : log.getUserChallenge().getChallenge().getCategories()) {
			session.setAttribute(cat.getName().toLowerCase(), cat);
		}
		return "views/viewLog";
	}
	
	@RequestMapping(path = "previousLog.clc", method = RequestMethod.GET)
		public String previousChallengeLog(HttpSession session, RedirectAttributes redir, int id) {
		ChallengeLog log = logDao.findById(id);
		User user = (User) session.getAttribute("user");
		
		
		
		List<ChallengeLog> challengeLogs = user.getCurrentUserChallenge().getChallengeLogs();
		challengeLogs.sort((c1, c2) -> c2.getEntryDate().compareTo(c1.getEntryDate()));
		for (ChallengeLog challengeLog : challengeLogs) {
			if(challengeLog.getEntryDate().compareTo(log.getEntryDate()) < 0) {
				log = challengeLog;
				break;
			}
		}
		redir.addFlashAttribute("log", log);
		redir.addFlashAttribute("page", "Journal");
				return "redirect:viewLogRedirect.clc";
	}
	@RequestMapping(path = "nextLog.clc", method = RequestMethod.GET)
	public String nextChallengeLog(HttpSession session, RedirectAttributes redir, int id) {
	ChallengeLog log = logDao.findById(id);
	User user = (User) session.getAttribute("user");
	
	List<ChallengeLog> challengeLogs = user.getCurrentUserChallenge().getChallengeLogs();
	challengeLogs.sort((c1, c2) -> c1.getEntryDate().compareTo(c2.getEntryDate()));
	for (ChallengeLog challengeLog : challengeLogs) {
		if(challengeLog.getId() > id) {
			log = challengeLog;
			break;
		}
	}
	redir.addFlashAttribute("log", log);
	redir.addFlashAttribute("page", "Journal");
			return "redirect:viewLogRedirect.clc";
}
}
