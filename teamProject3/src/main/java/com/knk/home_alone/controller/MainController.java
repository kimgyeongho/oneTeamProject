package com.knk.home_alone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	private MainService service;

	/*@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;*/

	// 메인화면 창
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		log.info("maie! GET");
		return "main";
	}

	// 회원가입 get
	@RequestMapping(value = "/authentication.do", method = RequestMethod.GET)
	public void authentication() throws Exception {
		log.info("GET authentication");
	}

	// 회원가입 get 국내
	@RequestMapping(value = "/signup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void getsignup() throws Exception {
		log.info("GET signup");
	}

	// 회원가입 get 국외
	@RequestMapping(value = "/signupENG.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void getsignupENG() throws Exception {
		log.info("GET signupENG");
	}

	// 도로명 셈플 테스트
	@RequestMapping(value = "/sample.do", method = RequestMethod.GET)
	public void sample() throws Exception {
		log.info("GET authentication");
	}

	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(MainVO VO) throws Exception {
		log.info("==========================");
		log.info("POST join");
		int IdCheck = service.oneteam_idCHeck(VO);
		if(IdCheck==0) {
		return "redirect:/";
		}else {
			service.userInsert(VO);
		}
		return "main";
	}
	
	//로그인 get
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public void login() throws Exception {
		log.info("GET authentication");
	}	
		
	//로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(MainVO VO, HttpServletRequest HSR, RedirectAttributes RA) throws Exception {
		log.info("==========================");
		log.info("post login");
		
		MainVO login = service.oneteam_login(VO);
		HttpSession session = HSR.getSession();

		if (login == null) {
		//	RA.addFlashAttribute("message", false); 메시지를 전달 할 것이라면  사용하기 일단 보류 
			session.setAttribute("user", null);
		} else {
			session.setAttribute("user", login);
		}
		return "redirect:/";
	}
	
	 //로그아웃 GET
	 @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	 public String logout(HttpSession session) throws Exception{
		 log.info("GET logout");

		 session.invalidate();
		
		 return "redirect:/";
	 }
	 
		 
	 //마이페이지 GET
	 @RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	 public void mypage() throws Exception{
		 log.info("GET mypage");
		 }
	 //마이페이지  주소 수정 
	 @RequestMapping(value="/mypageUpdate", method = RequestMethod.POST)
	 public String mypageUpdate(MainVO VO, HttpSession session) throws Exception{
		 	
	 service.oneteam_Update(VO);		 	
	 session.invalidate();
		 	
	 return "redirect:/";
	 }
	 //마이페이지  폰 번호 수정 
	 @RequestMapping(value="/NumberChange", method = RequestMethod.POST)
	 public String NumberChange(MainVO VO, HttpSession session) throws Exception{
		 	
	 service.oneteam_NumberUpdate(VO);		 	
	 session.invalidate();
		 	
	 return "redirect:/";
	 }
	 //마이페이지  폰 번호 수정 
	 @RequestMapping(value="/PassswordChange", method = RequestMethod.POST)
	 public String PassswordChange(MainVO VO, HttpSession session) throws Exception{
			 	
	 service.oneteam_PasswordUpdate(VO);		 	
	 session.invalidate();
			 	
	 return "redirect:/";
	 }
	 
	 // 회원 탈퇴 post
	 @RequestMapping(value="/userDelete", method = RequestMethod.POST)
	 public String userDelete(MainVO VO, HttpSession session, RedirectAttributes RA) throws Exception{	 
     MainVO mainVO = (MainVO)session.getAttribute("user");
     String Pass = mainVO.getUserPW();
     String voPass = VO.getUserPW();	
	 if(!(Pass.equals(voPass))) {
	 RA.addFlashAttribute("message", false);
	 return "redirect:mypage.do";
	 }else {
	 service.oneteam_userDelete(VO);
	 session.invalidate();
	 return "redirect:/";
	 }
	}
	 // 패스워드 확인
	 @ResponseBody
	 @RequestMapping(value="/passwordCheck", method = RequestMethod.POST)
	 public int passwordCheck(MainVO VO) throws Exception {
	 int passwordCheck = service.oneteam_passwordCheck(VO);
	 return passwordCheck;
	 }
	 // 아이디 중복
	 @ResponseBody
	 @RequestMapping(value="/IdCheck", method = RequestMethod.POST)
	 public int IdCheck(MainVO VO) throws Exception {
     int IdCheck = service.oneteam_idCHeck(VO);
     return IdCheck;
	}
	
}
