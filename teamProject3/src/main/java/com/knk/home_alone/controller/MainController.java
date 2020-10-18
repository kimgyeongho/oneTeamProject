package com.knk.home_alone.controller;

//주석추가
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

import com.knk.home_alone.api.JSONMaker;
import com.knk.home_alone.api.NaverLoginBO;
//import com.knk.home_alone.api.NaverLoginBO;
import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.addressDTO;
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

	@Autowired // 이메일 보내기 
	private JavaMailSender mailSender;
	 
	@Autowired // 이메일 보내기 회원가입 
	private MailSendService mailsender;
  
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
  
 
    private JSONMaker JSONMaker1;
    
    @Autowired
    private void setJSONMaker1(JSONMaker JSONMaker1) {
        this.JSONMaker1 = JSONMaker1;
    }

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
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

	// 도로명 셈플 테스트
	@RequestMapping(value = "/sample.do", method = RequestMethod.GET)
	public void sample() throws Exception {
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
		 // 회원가입 post
		 @RequestMapping(value = "/join", method = RequestMethod.POST)
		 public String postjoin(MainVO VO ,HttpServletRequest request) throws Exception {
			 log.info("==========================");
			 log.info("POST join");
			 /*	int IdCheck = service.oneteam_idCHeck(VO);
		if(IdCheck==1) {
		return "redirect:/signup.do";
		}else if(IdCheck==0){*/
			 String passwordSecurity = VO.getUserPW();
			 String password = pwencoder.encode(passwordSecurity);
			 VO.setUserPW(password);
			 service.userInsert(VO);
			 mailsender.mailKey(VO.getEmail(), VO.getUserID(), request);
			 
			 return "redirect:/";
			 
		 }
		 //회원가입 성공후 이메일 인증 완료
		 @RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		 public String key_alterConfirm(@RequestParam("userID") String userID, @RequestParam("user_key") String key) {
			 
			 mailsender.alterKeyService(userID, key); // mailsender의 경우 @Autowired
			 
			 return "signupSuccess";
		 }	
		 //로그인 post
		 @RequestMapping(value = "/login", method = RequestMethod.POST)
		 public String postlogin(MainVO VO, HttpServletRequest HSR, RedirectAttributes RA) throws Exception {
			 log.info("==========================");
			 log.info("post login");
			 HttpSession session = HSR.getSession();
			 try {
				 MainVO login = service.oneteam_login(VO);
				 
				 boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
				 if(login != null && PwMapping == true) {
					 session.setAttribute("user", login);
				 }/*else {
		session.setAttribute("user", null);
		//	RA.addFlashAttribute("message", false); 메시지를 전달 할 것이라면  사용하기 일단 보류 
		return "redirect:/login.do";}*/
			 }catch(NullPointerException e){
				 return "redirect:/login.do";
			 }
			 return "redirect:/";
		 }
		 //마이페이지  주소 수정 
		 @RequestMapping(value="/mypageUpdate", method = RequestMethod.POST)
		 public String mypageUpdate(MainVO VO, HttpSession session) throws Exception{
			 log.info("POST mypageUpdate");	 
			 service.oneteam_Update(VO);		 	
			 session.invalidate();
			 
			 return "redirect:/";
		 }
		 //마이페이지  폰 번호 수정 
		 @RequestMapping(value="/NumberChange", method = RequestMethod.POST)
		 public String NumberChange(MainVO VO, HttpSession session) throws Exception{
			 log.info("POST NumberChange");	 
			 service.oneteam_NumberUpdate(VO);		 	
			 session.invalidate();
			 
			 return "redirect:/";
		 }
		 //마이페이지  비밀번호 수정 
		 @RequestMapping(value="/PassswordChange", method = RequestMethod.POST)
		 public String PassswordChange(MainVO VO, HttpSession session) throws Exception{
			 log.info("POST PassswordChange");
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
			 log.info("POST passwordCheck");
			 MainVO login = service.oneteam_password_LoginCheck(VO);
			 boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
			 return PwMapping;
		 }
		 // 아이디 중복
		 @ResponseBody
		 @RequestMapping(value="/IdCheck", method = RequestMethod.POST)
		 public int IdCheck(MainVO VO) throws Exception {
			 log.info("POST IdCheck");
			 int IdCheck = service.oneteam_idCHeck(VO);
			 return IdCheck;
		 }
		 // 이메일 중복
		 @ResponseBody
		 @RequestMapping(value="/emailCheck", method = RequestMethod.POST)
		 public int emailCheck(MainVO VO) throws Exception {
			 log.info("POST emailCheck");
			 int emailCheck = service.oneteam_emailCheck(VO);
			 return emailCheck;
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
		 
		 // mailForm
		 @RequestMapping(value = "/sample/mailForm")
		 public String mailForm() {
			 
			 return "sample/mailForm";
		 }  
		 
		 // 이메일 중복
		 @ResponseBody
		 @RequestMapping(value="/Email_Success_Check", method = RequestMethod.POST)
		 public int Email_Success_Check(MainVO VO) throws Exception {
			 log.info("POST Email_Success_Check");
			 int emailCheck = service.oneteam_email_Success_Check(VO);
			 return emailCheck;
		 }
		 
		 // 비밀번호 찾기
		 @RequestMapping(value = "/find_identification_pw", method = RequestMethod.POST)
		 public String passwordSearch(@RequestParam("userName")String userName,
				 @RequestParam("userID")String userID,
				 @RequestParam("email")String email,
				 HttpServletRequest request , Model md ,HttpServletResponse response) throws Exception {
			 log.info("POST passwordSearch");
			 mailsender.mailPassword(userName, userID, email, request);
			 return "redirect:/";
			 
		 }
		 //비밀번호 찾기 유저 정보 확인
		 @ResponseBody
		 @RequestMapping(value="/userCheck", method = RequestMethod.POST)
		 public int userCheck(MainVO VO) throws Exception {	
			 log.info("POST userCheck");
			 int userCheck = service.oneteam_userCHeck(VO);
			 return userCheck;
		 }
		 
		 //임시적인 창 띄우기
		 @RequestMapping(value = "/board_all.do")
		 public void board_all() {
			 
		 }  
		 //임시적인 창 띄우기
		 @RequestMapping(value = "/map.do")
		 public void map() {
			 
		 }   
		//임시적인 창 띄우기
		 @RequestMapping(value = "/boardWrite.do")
		 public void boardWrite() {
			 
		 }
		 
		 //위도경도 테스스
		 @RequestMapping(value = "/sand", method = RequestMethod.POST)
		 public String address(addressDTO DTO,
				 HttpServletRequest request) throws Exception{
			 log.info("===========test===============");
			 service.insert_address(DTO);
		 JSONMaker1.sand();
		 
			 
			return "main";
	
		 

   }
}
