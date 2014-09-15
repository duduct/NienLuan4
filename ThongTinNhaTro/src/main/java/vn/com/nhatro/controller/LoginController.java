package vn.com.nhatro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.dao.UserRoleDao;
import vn.com.nhatro.model.User;
import vn.com.nhatro.model.UserRole;

@Controller
public class LoginController {
	@Autowired
	private UserRoleDao userroleDao;
	@Autowired
	private UserDao userDao;

	// Spring Security see this :
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			return new ModelAndView("redirect:/");
		}
		model.setViewName("login");

		return model;

	}

	/**
	 * 
	 * @author lonel_000
	 */
	@RequestMapping(value = "/dangky", method = RequestMethod.GET)
	public String hienThiFormDangKy() {
		return "dangky";
	}
	/**
	 * @author lonel_000
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/dangkyHandling", method = RequestMethod.POST)
	public String dangKy(@ModelAttribute User user) {
		user.setEnabled(true);
		userDao.add(user);
		UserRole userRole = new UserRole();
		userRole.setUser(user);
		userRole.setRole("ROLE_USER");
		userroleDao.add(userRole);
		return "home";
	}
}