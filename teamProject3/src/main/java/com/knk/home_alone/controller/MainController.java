package com.knk.home_alone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;

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
		if(IdCheck==1) {
		return "redirect:/signup.do";
		}else if(IdCheck==0){
			String passwordSecurity = VO.getUserPW();
			String password = pwencoder.encode(passwordSecurity);
			VO.setUserPW(password);
			service.userInsert(VO);
		}
		return "redirect:/";
	}
	
	//로그인 get
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public void main2() throws Exception {
		log.info("GET main 로그인 된 메인페이지");
	}	
		
	//로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(MainVO VO, HttpServletRequest HSR, RedirectAttributes RA) throws Exception {
		log.info("==========================");
		log.info("post login");
		HttpSession session = HSR.getSession();
		MainVO login = service.oneteam_login(VO);
		
		boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
		if(login != null && PwMapping == true) {
			session.setAttribute("user", login);
		}/*else {
		session.setAttribute("user", null);
		//	RA.addFlashAttribute("message", false); 메시지를 전달 할 것이라면  사용하기 일단 보류 
		return "redirect:/login.do";}*/
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
	 //마이페이지  비밀번호 수정 
	 @RequestMapping(value="/PassswordChange", method = RequestMethod.POST)
	 public String PassswordChange(MainVO VO, HttpSession session) throws Exception{
			 	
	 String passwordSecurity = VO.getUserPW();
	 String password = pwencoder.encode(passwordSecurity);
	 VO.setUserPW(password);
	 service.oneteam_PasswordUpdate(VO);		 	
	 session.invalidate();
			 	
	 return "redirect:/";
	 }
	 
	 // 회원 탈퇴 post
	 @RequestMapping(value="/userDelete", method = RequestMethod.POST)
	 public String userDelete(MainVO VO, HttpSession session, RedirectAttributes RA) throws Exception{	 
		 log.info("POST userDelete");
	service.oneteam_userDelete(VO);
	 session.invalidate();
	 return "redirect:/";
	 }
	 // 패스워드 확인
	 @ResponseBody
	 @RequestMapping(value="/passwordCheck", method = RequestMethod.POST)
	 public boolean passwordCheck(MainVO VO) throws Exception {
	 MainVO login = service.oneteam_login(VO);
	 boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
	 return PwMapping;
	 }
	 // 패스워드 확인
	 @ResponseBody
	 @RequestMapping(value="/passwordCheck2", method = RequestMethod.POST)
	 public boolean passwordCheck2(MainVO VO) throws Exception {
	 MainVO login = service.oneteam_passwordCheck(VO);
	 boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
	 return PwMapping;
	 }
	 // 아이디 중복
	 @ResponseBody
	 @RequestMapping(value="/IdCheck", method = RequestMethod.POST)
	 public int IdCheck(MainVO VO) throws Exception {
	 int IdCheck = service.oneteam_idCHeck(VO);
     return IdCheck;
	 }
	 //아이디 찾기 페이지 GET
	 @RequestMapping(value="/find_id.do", method = RequestMethod.GET)
	 public void getFind_id() throws Exception{
	 log.info("GET find_id");
	 }
	 
	 // 아이디 찾기
	 @RequestMapping(value = "/find_id", method = RequestMethod.POST)
	 public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md
	 ,@RequestParam("userName") String userName) throws Exception{
	 md.addAttribute("id", service.oneteam_findId(response, email, userName));
	 
	 return "find_id2";
		}
	 
	//아이디 찾기 페이지 GET
	@RequestMapping(value="/find_pw.do", method = RequestMethod.GET)
	public void getFind_pw() throws Exception{
	log.info("GET find_pw");
		 }
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MainVO VO, HttpServletResponse response) throws Exception{
	service.find_pw(response, VO);
		}
		
}
