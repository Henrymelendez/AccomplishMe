package com.skilldistillery.accomplish.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.CategoryDAO;
import com.skilldistillery.accomplish.data.ChallengeDetailDAO;
import com.skilldistillery.accomplish.data.ChallengeLogDAO;
import com.skilldistillery.accomplish.data.ChallengeLogDetailDAO;
import com.skilldistillery.accomplish.entities.Category;
import com.skilldistillery.accomplish.entities.ChallengeDetail;
import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class ChallengeLogDetailController {
	
	@Autowired
	CategoryDAO catDao;
	@Autowired
	ChallengeLogDetailDAO cldDao;
	@Autowired
	ChallengeLogDAO clDao;
	@Autowired
	ChallengeDetailDAO cdDao;
	
	
	@RequestMapping(path = "addChallengeDetail.cld", method = RequestMethod.POST)
	public String addToChallengeLog(ChallengeLogDetail detail, RedirectAttributes redir, int logId, int cdId, HttpSession session) {
		User user = (User)session.getAttribute("user");
		ChallengeDetail challengeDetail = cdDao.findbyId(cdId);
		ChallengeLog log = user.findLogById(logId);
		
		detail.setChallengeDetail(challengeDetail);
		detail.setChallengeLog(log);
		detail.setActive(true);
		
		detail = cldDao.addLogDetail(detail);
		log.addChallengeLogDetail(detail);
		
		session.setAttribute("user", user);
		redir.addFlashAttribute("log", log);
		redir.addFlashAttribute("page", "Journal");
		
		return "redirect:viewLogRedirect.clc";
	}
	
	
	
	
	@RequestMapping(path="addChallengeDetail.cld", method= RequestMethod.GET)
	public String startaddToChallengeLog(Model model, String name, int id) {
		ChallengeLog log = clDao.findById(id);
		model.addAttribute("log", log);
		List<ChallengeDetail> challengeDetails = cdDao.findByCategoryName(name);
		model.addAttribute("details", challengeDetails);
		model.addAttribute("page", "Journal");
		
		
		
		return "views/createChallengeLogDetails";
	}
	
	@RequestMapping(path="removeChallengeDetail.cld", method=RequestMethod.POST)
	public String removeDetail(HttpSession session, int id, int logId, RedirectAttributes redir) {
		User user = (User)session.getAttribute("user");
		ChallengeLog log = user.findLogById(logId);
		ChallengeLogDetail detail = cldDao.findById(id);
		
		
		detail = cldDao.removeLogDetail(detail);
		log.removeChallengeLogDetail(detail);
		
		session.setAttribute("user", user);
		redir.addFlashAttribute("page", "Journal");
		redir.addFlashAttribute("log", log);
		
		
		return "redirect:viewLogRedirect.clc";
	}
	
	@RequestMapping(path = "createDetail.cld", method = RequestMethod.POST)
	public String createDetail(ChallengeDetail detail, HttpSession session, String categoryName, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		Category category = catDao.findByName(categoryName);
		detail.setCategory(category);
		detail.setCreator(user);
		cdDao.addDetail(detail);
		user.addCreatedChallengeDetail(detail);
		session.setAttribute("user", user);
		redir.addFlashAttribute("page","Anything");
		return"redirect:userTasks.user";
	}
	
	@RequestMapping(path = "createDetail.cld", method = RequestMethod.GET)
	public String startCreateDetail(String pageName) {
		
		
		return "views/create" + pageName;
	}
	
}
