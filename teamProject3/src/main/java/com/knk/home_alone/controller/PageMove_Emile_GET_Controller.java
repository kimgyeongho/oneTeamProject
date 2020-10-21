package com.knk.home_alone.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.knk.home_alone.api.NaverLoginBO;
import com.knk.home_alone.service.MailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PageMove_Emile_GET_Controller {
		/* NaverLoginBO */
		private NaverLoginBO naverLoginBO;
	
		@Autowired
		private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
			this.naverLoginBO = naverLoginBO;
		}
		@Autowired // 이메일 보내기  고객상담으로 만든 것
		private JavaMailSender mailSender; 
		
		@Autowired // 이메일 보내기 회원가입 
		private MailSendService mailsender; 
		 
		
		 
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
		
		
		
		//서비스 페이지 get
		@RequestMapping(value = "/service_info.do", method = { RequestMethod.GET, RequestMethod.POST })
		public void getservice_info() throws Exception {
			log.info("GET service_info");
		}
		//서비스 페이지 get
		@RequestMapping(value = "/perpose.do", method = { RequestMethod.GET, RequestMethod.POST })
		public void getperpose() throws Exception {
			log.info("GET service_info");
		}		
		
		

		//위도,경도 test용 get
		@RequestMapping(value = "/sample.do", method = RequestMethod.GET)
		public void send() throws Exception {
			log.info("GET sample");
		}	
		
		
		
		//로그인 get
		@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String login(Model model,HttpSession session) throws Exception {
			log.info("GET main 로그인 된 메인페이지");
	        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	        
	        System.out.println("네이버:" + naverAuthUrl);
	        model.addAttribute("url", naverAuthUrl);
	        return "login";
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
		
		
		
		//아이디 찾기 페이지 GET
		@RequestMapping(value="/find_id.do", method = RequestMethod.GET)
		public void getFind_id() throws Exception{
		log.info("GET find_id");
		}
		//비밀번호  찾기 페이지 GET
		@RequestMapping(value="/find_pw.do", method = RequestMethod.GET)
		public void getFind_pw() throws Exception{
		log.info("GET find_pw");
		}
		
		
		
		//회원가입 성공후 이메일 인증 완료
		@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		public String key_alterConfirm(@RequestParam("userID") String userID, @RequestParam("user_key") String key) {
			 
		mailsender.alterKeyService(userID, key); // mailsender의 경우 @Autowired
			 
		return "signupSuccess";
		}	
		//고객상담 이메일 보내기 
		@RequestMapping(value = "/sample/mailSending.do")
		public String mailSending(HttpServletRequest request) {
			 log.info("mailSending");
			 String setfrom = "apdlvmf1562@gmail.com";
			 String tomail = request.getParameter("tomail"); // 받는 사람 이메일
			 String title = request.getParameter("title"); // 제목
			 String content = request.getParameter("content"); // 내용
			 try {
				 
				 MimeMessage message = mailSender.createMimeMessage();
				 MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						 true, "UTF-8");         
				 
				 
				 messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				 messageHelper.setTo(tomail); // 받는사람 이메일
				 messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				 messageHelper.setText(content); // 메일 내용
				 
				 mailSender.send(message);
				 
			 } catch (Exception e) {
				 System.out.println(e);
			 }
			 
	    return "sample/mailForm";
		 }
		// mailForm 고객상담 이메일 보내기
		@RequestMapping(value = "/sample/mailForm")
		public String mailForm() {
			 
		return "sample/mailForm";
		}  
		
		
		
		//게시판 이동
		@RequestMapping(value = "/board_all.do")
		public void board_all() {
			 
		}  
		
		
		
		//맵으로 이동
		@RequestMapping(value = "/map.do")
		public void map() {
			 
		}   
		
		
		
		//게시판 글쓰기 이동
		@RequestMapping(value = "/boardWrite.do")
		public void boardWrite() {
			 
		}
		
		//목표 페이지 이동
		@RequestMapping(value = "/purpose.do")
		public void purpose() {
					 
		}
		
		//목표 페이지 이동
		@RequestMapping(value = "/tips.do")
		public void tips() {
							 
		}
		//목표 페이지 이동
		@RequestMapping(value = "/maker.do")
		public void maker() {
									 
		}
		//목표 페이지 이동
		@RequestMapping(value = "/service_info.do")
		public void service_info(){
											 
		}
}
