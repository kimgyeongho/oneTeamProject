package com.knk.home_alone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.service.MailSendService;
import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {

	@Autowired
	private MainService service;
	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;

	@Autowired // 이메일 보내기 회원가입
	private MailSendService mailsender;

	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(MainVO VO, HttpServletRequest request) throws Exception {
		log.info("==========================");
		log.info("POST join");
		/*
		 * int IdCheck = service.oneteam_idCHeck(VO); if(IdCheck==1) { return
		 * "redirect:/signup.do"; }else if(IdCheck==0){
		 */
		String passwordSecurity = VO.getUserPW();
		String password = pwencoder.encode(passwordSecurity);
		VO.setUserPW(password);
		service.userInsert(VO);
		mailsender.mailKey(VO.getEmail(), VO.getUserID(), request);

		return "redirect:/";

	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String userDelete(MainVO VO, HttpSession session, RedirectAttributes RA) throws Exception {
		log.info("POST userDelete");
		service.oneteam_userDelete(VO);
		session.invalidate();
		return "redirect:/";
	}

}
