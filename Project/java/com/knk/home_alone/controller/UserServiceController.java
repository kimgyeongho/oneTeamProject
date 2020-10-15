package com.knk.home_alone.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.service.MailSendService;
import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserServiceController {
	@Autowired
	private MainService service;
	@Autowired // 이메일 보내기
	private JavaMailSender mailSender;
	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;
	@Autowired // 이메일 보내기 회원가입
	private MailSendService mailsender;

	// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md,
			@RequestParam("userName") String userName) throws Exception {
		md.addAttribute("id", service.oneteam_findId(response, email, userName));

		return "find_id2";
	}

	// 고객상담 이메일 보내기
	@RequestMapping(value = "mailSending.do")
	public String mailSending(HttpServletRequest request) {
		log.info("mailSending");
		String setfrom = "apdlvmf1562@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);

		} catch (Exception e) {
			System.out.println(e);
		}

		return "mailForm";
	}

	// 마이페이지 폰 번호 수정
	@RequestMapping(value = "/NumberChange", method = RequestMethod.POST)
	public String NumberChange(MainVO VO, HttpSession session) throws Exception {
		log.info("POST NumberChange");
		service.oneteam_NumberUpdate(VO);
		session.invalidate();

		return "redirect:/";
	}

	// 마이페이지 비밀번호 수정
	@RequestMapping(value = "/PassswordChange", method = RequestMethod.POST)
	public String PassswordChange(MainVO VO, HttpSession session) throws Exception {
		log.info("POST PassswordChange");
		String passwordSecurity = VO.getUserPW();
		String password = pwencoder.encode(passwordSecurity);
		VO.setUserPW(password);
		service.oneteam_PasswordUpdate(VO);
		session.invalidate();

		return "redirect:/";
	}

	// 마이페이지 주소 수정
	@RequestMapping(value = "/mypageUpdate", method = RequestMethod.POST)
	public String mypageUpdate(MainVO VO, HttpSession session) throws Exception {
		log.info("POST mypageUpdate");
		service.oneteam_Update(VO);
		session.invalidate();

		return "redirect:/";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/find_identification_pw", method = RequestMethod.POST)
	public String passwordSearch(@RequestParam("userName") String userName, @RequestParam("userID") String userID,
			@RequestParam("email") String email, HttpServletRequest request, Model md, HttpServletResponse response)
			throws Exception {
		log.info("POST passwordSearch");
		mailsender.mailPassword(userName, userID, email, request);
		return "redirect:/";

	}

	// 비밀번호 찾기 유저 정보 확인
	@ResponseBody
	@RequestMapping(value = "/userCheck", method = RequestMethod.POST)
	public int userCheck(MainVO VO) throws Exception {
		log.info("POST userCheck");
		int userCheck = service.oneteam_userCHeck(VO);
		return userCheck;
	}
}
