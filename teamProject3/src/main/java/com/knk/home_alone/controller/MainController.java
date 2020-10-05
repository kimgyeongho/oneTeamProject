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

	@Autowired // 이메일 보내기
	private JavaMailSender mailSender;
	
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
	 
	//비밀번호  찾기 페이지 GET
	@RequestMapping(value="/find_pw.do", method = RequestMethod.GET)
	public void getFind_pw() throws Exception{
	log.info("GET find_pw");
		 }
	/*@RequestMapping("/sendEmail.do")
	public void sendEmail(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		//메일 관련 정보 
		String host = "smtp.naver.com";
		final String username = "2018food"; //네이버 이메일 주소중 @naver.com 앞주소 작성
		final String password = "oneteam123"; //네이버 이메일 비밀번호를 작성 
		int port=587;
		
		//메일 내용 
		String recipient = "2018food@naver.com"; // 메일을 발송할 이메일 주소를 기재해 줍니다.
		String subject = "이메일 발송시 제목"; //메일 발송시 제목을 작성
		String body = "이름: 김경호입니다.\n\n"; //메일 발송시 내용 작성

		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.ayth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new Authenticator(){
			String un= username;
			String pw= password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un,pw);
			}
			
		});
		session.setDebug(true); //for debug
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("2018food@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
		
	}*/
	
	// mailForm
	  @RequestMapping(value = "/mailForm")
	  public String mailForm() {
	   
	    return "/mailForm";
	  }  
	  /*	 
	  // mailSending 코드
	  @RequestMapping(value = "/mailSending")
	  public String mailSending(HttpServletRequest request) {
	   
	    String setfrom = "apdlvmf1562@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/mailForm";
	  }
*/

	// mailSending 코드
		@RequestMapping(value = "mailSending.do")
		public String mailSending(HttpServletRequest request) {
        
			String setfrom = "2018food@naver.com";
			String tomail = request.getParameter("tomail"); // 받는 사람 이메일
			String title = request.getParameter("title"); // 제목
			String content = request.getParameter("content"); // 내용
            System.out.println("안되는 이유좀 ");
			try {
	            System.out.println("안되는 이유좀 2");

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println("왜 안되는거니? ");
			}

			return "mailForm";
		}
		
		
		
		
		
}
