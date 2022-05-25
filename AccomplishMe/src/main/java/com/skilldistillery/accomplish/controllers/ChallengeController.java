package com.skilldistillery.accomplish.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.CategoryDAO;
import com.skilldistillery.accomplish.data.ChallengeDAO;
import com.skilldistillery.accomplish.entities.Category;
import com.skilldistillery.accomplish.entities.Challenge;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class ChallengeController {
	@Autowired
	ChallengeDAO challengeDAO;
	@Autowired
	CategoryDAO catDAO;

	@RequestMapping(path = "findChallenges.ch", method = RequestMethod.GET)
	public String createChallengePage(Model model) {
		List<Challenge> challenges = challengeDAO.findAll();
		model.addAttribute("challenges", challenges);

		return "views/findChallenges";
	}

	@RequestMapping(path = "createChallenge.ch", method = RequestMethod.POST)
	public String createChallenge(Challenge challenge, RedirectAttributes redir, HttpSession session,
			String... categoryName) {
		
		String view = "redirect:loginRedirect.do";
		User user = (User) session.getAttribute("user");
		
		challenge.setActive(true);
		challenge.setCreator(user);
		List<Category> categories = new ArrayList<>();
		Category category = null;
		for (String name : categoryName) {
			category = catDAO.findByName(name);
			categories.add(category);
			
		}
		if (!categories.isEmpty()) {
			for (Category cat : categories) {
				challenge.addCategory(cat);
			}
		}
		challenge = challengeDAO.createChallenge(challenge);
		if (challenge != null) {
			view = "redirect:findChallenges.ch";
			redir.addFlashAttribute("page", "Challenge");
		} else {
			redir.addFlashAttribute("message", "Unable to add Challenge");
			redir.addFlashAttribute("page", "Me");
		}
		return view;
	}

	@RequestMapping(path = "createChallenge.ch", method = RequestMethod.GET)
	public String startCreateChallenge() {
		String view = "views/createNewChallenge";

		return view;
	}

	@RequestMapping(path = "deleteChallenge.ch", method = RequestMethod.POST)
	public String deleteChallenge(int id, RedirectAttributes redir) {
		boolean challenge = challengeDAO.deleteChallenge(id);

		if (challenge == true) {
			return "redirect:findChallenges.ch";
		} else {
			redir.addAttribute("message", "Unable to Delete");
			redir.addAttribute("page", "ME");
			return "redirect:loginRedirect.do";
		}

	}

	@RequestMapping(path = "editChallenge.ch", method = RequestMethod.GET)
	public ModelAndView startEditChallenge(int id, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Challenge chal = challengeDAO.findById(id);

		if (chal != null) {
			mv.addObject("challenge", chal);
			mv.setViewName("views/editChallenge");
			for (Category cat : chal.getCategories()) {
				mv.addObject(cat.getName().toLowerCase(), cat);
			}
		} else {
			redir.addFlashAttribute("message", "Unable to Edit challenge");
			mv.setViewName("redirect:loginRedirect.do");
		}

		return mv;

	}

	@RequestMapping(path = "editChallenge.ch", method = RequestMethod.POST)
	public ModelAndView editChallenge(Challenge challenge, HttpSession session, RedirectAttributes redir,
			String... categoryName) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		List<Category> categories = new ArrayList<>();
		Category category = null;
		for (String name : categoryName) {
			category = catDAO.findByName(name);
			categories.add(category);
		}
		if (!categories.isEmpty()) {
			for (Category cat : categories) {
				challenge.addCategory(cat);
			}
		}
		Challenge added = challengeDAO.editChallenge(challenge);
		if(user.getCurrentUserChallenge() != null && added.equals(user.getCurrentUserChallenge().getChallenge())) {
			for (Category cat : user.getCurrentUserChallenge().getChallenge().getCategories()) {
				session.removeAttribute(cat.getName().toLowerCase());
			}
			user.getCurrentUserChallenge().setChallenge(added);
		}
		session.setAttribute("user", user);
		session.setAttribute("challenge", added);
		mv.setViewName("redirect:findChallenges.ch");
		redir.addFlashAttribute("page", "Challenge");

		return mv;
	}

}
