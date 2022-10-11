
package xyz.itwill.snb.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.itwill.snb.dto.User;
import xyz.itwill.snb.exception.LoginAuthFailException;
import xyz.itwill.snb.exception.UserExistsException;
import xyz.itwill.snb.exception.UserNotFoundException;
import xyz.itwill.snb.service.UserService;

@Controller

@RequestMapping("/user")

@RequiredArgsConstructor
public class UserController {
	private final UserService userService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join_form";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute User user) throws UserExistsException {

		userService.addUser(user);

		return "redirect:/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login_form";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, HttpSession session)
			throws LoginAuthFailException, UserNotFoundException {

		userService.loginAuth(user);

		session.setAttribute("loginUser", userService.getUser(user.getId()));

		return "redirect:/index";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/search_id", method = RequestMethod.GET)
	public String searchId() {
				
		return "searchId";
	}
	
	@RequestMapping(value = "/search_id", method = RequestMethod.POST)
	public String searchId(User user, Model model) throws UserNotFoundException {
		model.addAttribute("user",userService.findId(user));
		
		return "searchId";
		
		
	}
	
	@RequestMapping(value = "/search_passwd", method = RequestMethod.GET)
	public String searchPasswd() {
		return "searchPasswd";
	}
	
	@RequestMapping(value = "/search_passwd", method = RequestMethod.POST)
	public String searchPasswd(User user, Model model) throws UserNotFoundException {
		
		model.addAttribute("user",userService.findPasswd(user));
		
		return "changePasswd";
		
		
	}
	
	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public String changePwd() {
			
		return "changePasswd";
	}
	
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public String changePwd(User user) throws UserNotFoundException {
		
		userService.modifyPasswd(user);
		
		return "redirect:/index";
		
	}
	
	@RequestMapping("/modify")
	public String userModify(HttpSession session) throws UserNotFoundException {
		
		User loginUser = (User)session.getAttribute("loginUser");
					
		return "join_modify";
	}
	

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String userModify(User user) throws UserNotFoundException {
		userService.modifyUser(user);
		
		return "redirect:/index";
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = userService.idCheck(id);
		
		return cnt ;
		
	}
	
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		
		int cnt = userService.emailCheck(email);
		
		return cnt ;
		
	}
}
