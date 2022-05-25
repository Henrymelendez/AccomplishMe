package com.skilldistillery.accomplish.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.accomplish.data.UserDAO;
import com.skilldistillery.accomplish.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path={"/", "home.do"})
	public String home(Model model, HttpSession session, RedirectAttributes redir) {
		String view = "home";
		User user = (User)session.getAttribute("user");
		if(user != null) {
//			session.setAttribute("user", user);
			redir.addFlashAttribute("page", "Me");
			view = "redirect:loginRedirect.do";
		}
		
		return view;
	}
	
	@RequestMapping(path="createUser.do", method = RequestMethod.GET)
	public String createUserPage() {
		return "views/register";
	}
	
	
	@RequestMapping(path= "createUser.do", method = RequestMethod.POST)
	public String createNewUser(HttpSession session, RedirectAttributes redir, Integer feet, Integer inches, String firstName,
			String lastName, Double weight, String username, String password) {
		String view = "views/userHome";
		Double height = (double)((feet * 12) + inches);
		User user = new User(username, password, height, weight, firstName, lastName, true);
		userDAO.createaUser(user);	
		
		if (user.getId() != 0) {
			session.setAttribute("user", user);
		} else {
			redir.addFlashAttribute("message", "Username is taken");
			view = "redirect:login.do";
		}
		
		return view;
	}
	
	@RequestMapping(path= "login.do", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session, RedirectAttributes redir, Model model) {
		String view = "home";
		User user = userDAO.findByUserNameAndPassword(username, password);
		if(user != null) {
			session.setAttribute("user", user);
			if(user.getCurrentUserChallenge() != null && user.getCurrentUserChallenge().getChallengeLogs() != null)  {
			user.getCurrentUserChallenge().getChallengeLogs().size();
			}
			redir.addFlashAttribute("page", "Me");
			view = "redirect:loginRedirect.do";
		} else {
			model.addAttribute("message", "Username or Password is incorrect");
		}
		return view;
	}
	
	@RequestMapping(path="loginRedirect.do")
	public String loginRedirect(HttpSession session) {
	
		return "views/userHome";
	}
	
	
	@RequestMapping(path= "deleteUser.do")
	public String deleteUser(int id, HttpSession session, RedirectAttributes redir) {
		boolean deleted = userDAO.deleteUser(id);
		session.removeAttribute("user");
		
		if(deleted == true) {
			return "redirect:home.do";
		}else {
			redir.addFlashAttribute("message", "unable to delete account");
			return "redirect:loginRedirect.do";
		}
	}
	
	@RequestMapping(path = "startEdit.do")
	public ModelAndView startEditUser(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		if(user !=null) {
			mv.addObject("page", user.getFirstName());
			mv.setViewName("views/accountinfo");
		}else {
			mv.setViewName("redirect:home.do");
		}
		return mv;
	}
	
	@RequestMapping(path= "editUser.do")
	public ModelAndView editUser(User user, Integer feet, Integer inches, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		user.setHeight((double)((feet*12) + inches));
		user = userDAO.editUser(user);
		session.setAttribute("user", user);
		mv.setViewName("views/userHome");
		return mv;
	}
	
	@RequestMapping(path = "startEditUsernamePassword.do")
	public ModelAndView startUsernamePassword(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		if(user !=null) {
			mv.addObject("user", user);
			mv.setViewName("views/changePasswordAndUsername");
		}else {
			mv.setViewName("redirect:home.do");
		}
		return mv;
	}
	@RequestMapping(path= "editUsernamePassword.user")
	public ModelAndView editUsernamePassword(String username, String password, String newPassword, String confirmPassword, HttpSession session,
			RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		StringBuilder sb = new StringBuilder();
		sb.append("Succesfully Updated");
		User user = (User) session.getAttribute("user");
		user.getUserChallenges().size();
		if(!user.getUsername().equals(username)) {
			user.setUsername(username);
			sb.append(" username");
		}
		if(password.equals(user.getPassword()) && !newPassword.isEmpty() && newPassword.equals(confirmPassword)) {
			user.setPassword(newPassword);
			sb.append(" password");
		}
		user = userDAO.editUsernamePassword(user);
		if(sb.toString().equals("Succesfully Updated")) {
			sb.delete(0, sb.length());
			sb.append("Could not update");
		}
		redir.addFlashAttribute("user", user);
		redir.addFlashAttribute("message", sb.toString());
		session.setAttribute("user", user);
		mv.setViewName("redirect:loginRedirect.do");
		return mv;
	}
	
	@RequestMapping(path="userTasks.user")
	public String userTasks(HttpSession session, Model model) {
		model.addAttribute("page", "Anything");
		User user = (User) session.getAttribute("user");
		user.getCreatedChallengeDetails().size();
		
		return "views/userTasks";
	}
	
	@RequestMapping(path="logout.user")
	public String logout(HttpSession session, RedirectAttributes redir) {
		session.removeAttribute("user");
		session.removeAttribute("challenge");
		session.removeAttribute("workout");
		session.removeAttribute("book");
		session.removeAttribute("food");
		return "redirect:home.do";
	}
}
