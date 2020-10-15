package com.knk.home_alone.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knk.home_alone.api.NaverLoginBO;
//import com.knk.home_alone.api.NaverLoginBO;
import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.boardVO;
import com.knk.home_alone.service.MailSendService;
import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	private MainService service;

	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;

	@Autowired // 이메일 보내기 회원가입
	private MailSendService mailsender;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	

	// 도로명 셈플 테스트
	@RequestMapping(value = "/sample.do", method = RequestMethod.GET)
	public void sample() throws Exception {
		log.info("GET authentication");
	}

	// 로그인 get
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) throws Exception {
		log.info("GET main 로그인 된 메인페이지");
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	// 회원가입 성공후 이메일 인증 완료
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("userID") String userID, @RequestParam("user_key") String key) {

		mailsender.alterKeyService(userID, key); // mailsender의 경우 @Autowired

		return "signupSuccess";
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(MainVO VO, HttpServletRequest HSR, RedirectAttributes RA) throws Exception {
		log.info("==========================");
		log.info("post login");
		HttpSession session = HSR.getSession();
		try {
			MainVO login = service.oneteam_login(VO);

			boolean PwMapping = pwencoder.matches(VO.getUserPW(), login.getUserPW());
			if (login != null && PwMapping == true) {
				session.setAttribute("user", login);
			} /*
				 * else { session.setAttribute("user", null); // RA.addFlashAttribute("message",
				 * false); 메시지를 전달 할 것이라면 사용하기 일단 보류 return "redirect:/login.do";}
				 */
		} catch (NullPointerException e) {
			return "redirect:/login.do";
		}
		return "redirect:/";
	}

	// 패스워드 확인
	@ResponseBody
	@RequestMapping(value = "/passwordCheck", method = RequestMethod.POST)
	public boolean passwordCheck(MainVO VO) throws Exception {
		log.info("POST passwordCheck");
		MainVO login = service.oneteam_password_LoginCheck(VO);
		boolean PwMapping = pwencoder.matches(VO.getUserPW(), login.getUserPW());
		return PwMapping;
	}

	// 아이디 중복
	@ResponseBody
	@RequestMapping(value = "/IdCheck", method = RequestMethod.POST)
	public int IdCheck(MainVO VO) throws Exception {
		log.info("POST IdCheck");
		int IdCheck = service.oneteam_idCHeck(VO);
		return IdCheck;
	}

	// 이메일 중복
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int emailCheck(MainVO VO) throws Exception {
		log.info("POST emailCheck");
		int emailCheck = service.oneteam_emailCheck(VO);
		return emailCheck;
	}

	// mailForm
	@RequestMapping(value = "/mailForm")
	public String mailForm() {

		return "/mailForm";
	}

	// 이메일 중복
	@ResponseBody
	@RequestMapping(value = "/Email_Success_Check", method = RequestMethod.POST)
	public int Email_Success_Check(MainVO VO) throws Exception {
		log.info("POST Email_Success_Check");
		int emailCheck = service.oneteam_email_Success_Check(VO);
		return emailCheck;
	}

	@RequestMapping("/getBoardList.do")
	public String getBoardList(boardVO vo, Model mav) throws Exception {
		if (vo.getSerchKeyword() == null) vo.setSerchKeyword("");
		System.out.println(vo.getSerchKeyword());
		mav.addAttribute("boardList", service.getboardList(vo));
		return "board_all";
	}

}
