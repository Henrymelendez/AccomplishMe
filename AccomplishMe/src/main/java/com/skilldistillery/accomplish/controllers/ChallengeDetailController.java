package com.skilldistillery.accomplish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.CategoryDAOIMpl;
import com.skilldistillery.accomplish.data.ChallengeDetailDAO;
import com.skilldistillery.accomplish.entities.Category;
import com.skilldistillery.accomplish.entities.ChallengeDetail;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class ChallengeDetailController {

	
	@Autowired
	private ChallengeDetailDAO cdDao;
	@Autowired
	private CategoryDAOIMpl catDao;
	
	@RequestMapping(path = "createDetail.cld", method = RequestMethod.POST)
	public String createDetail(ChallengeDetail detail, HttpSession session, String categoryName, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		Category category = catDao.findByName(categoryName);
		detail.setCategory(category);
		detail.setCreator(user);
		detail.setActive(true);
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
	
	@RequestMapping(path="editDetail.cdc", method = RequestMethod.GET)
	public String startEditDetail(int id, Model model){
		ChallengeDetail detail = cdDao.findbyId(id);
		String pageName = detail.getCategory().getName();
		model.addAttribute("detail", detail);
		return "views/" + pageName + "Edit";
	}
	
	@RequestMapping(path = "editDetail.cdc", method = RequestMethod.POST)
	public String editDetail(ChallengeDetail detail, HttpSession session, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		
		ChallengeDetail removeMe = cdDao.findbyId(detail.getId());
		user.removeCreatedChallengeDetail(removeMe);
		
		detail = cdDao.editDetail(detail);
		user.addCreatedChallengeDetail(detail);
		
		session.setAttribute("user", user);
		redir.addFlashAttribute("page", "Anything");
		
		
		return "redirect:userTasks.user";
	}
	
	@RequestMapping(path = "deleteDetail.cdc", method= RequestMethod.POST)
	public String removeDetail(int id, HttpSession session, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		
		ChallengeDetail removeMe = cdDao.findbyId(id);
		user.removeCreatedChallengeDetail(removeMe);
		
		removeMe = cdDao.removeDetail(removeMe);
		
		session.setAttribute("user", user);
		redir.addFlashAttribute("page", "Anything");
		
		
		return "redirect:userTasks.user";
	}
}
