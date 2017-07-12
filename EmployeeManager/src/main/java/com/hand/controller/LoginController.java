package com.hand.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hand.pojo.User;
import com.hand.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	/**
	 * 用户未登录是跳转到登陆页面
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public String toLogin() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		User user = userService.selectUser(account, password);
		String code = (String) session.getAttribute("verCode");
		String error = null;
		if (user == null) {
			error = "用户名或密码错误！";
			session.removeAttribute("error");
			session.setAttribute("error", error);
			return "login";
		}
		if (!captcha.equals(code)) {
			error = "验证码错误，要不您换一张?";
			session.removeAttribute("error");
			session.setAttribute("error", error);
			return "login";
		}
		session.removeAttribute("user");
		session.setAttribute("user", user);
		return "list";
	}
}
