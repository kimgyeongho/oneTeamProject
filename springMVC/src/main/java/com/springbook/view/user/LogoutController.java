package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LogoutController {
	public LogoutController() {
		System.out.println("LogoutController 빈 생성");
	}
	@RequestMapping("/logout.do")
	public String handleRequest(HttpSession session) {
		session.invalidate();

		return "login.jsp";
	}

}
