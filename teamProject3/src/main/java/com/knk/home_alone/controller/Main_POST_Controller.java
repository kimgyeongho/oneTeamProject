package com.knk.home_alone.controller;

//주석추가
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.addressDTO;
import com.knk.home_alone.service.JSONservice;
import com.knk.home_alone.service.MailSendService;
import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class Main_POST_Controller {

	@Autowired 
	private MainService service;

	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;

	@Autowired // 이메일 보내기 회원가입 
	private MailSendService mailsender; 
	
    @Autowired //json 파일 위도,경도 값으로 파일 만들기
    private JSONservice jsonService;
    
    
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
	 // 마이페이지 회원 탈퇴 post
	 @RequestMapping(value="/userDelete", method = RequestMethod.POST)
	 public String userDelete(MainVO VO, HttpSession session, RedirectAttributes RA) throws Exception{	 
	 log.info("POST userDelete");
	 service.oneteam_userDelete(VO);
	 session.invalidate();
	 return "redirect:/";
	 }
		 
	 
	 
	 // 로그인할때 패스워드 확인
     @ResponseBody
     @RequestMapping(value="/passwordCheck", method = RequestMethod.POST)
	 public ResponseEntity<String> passwordCheck(MainVO VO) throws Exception {
	 log.info("POST passwordCheck");
	 MainVO login = service.oneteam_password_LoginCheck(VO);
	 boolean PwMapping = pwencoder.matches(VO.getUserPW(),login.getUserPW());
	 System.out.println(PwMapping);
	 HttpHeaders headers = new HttpHeaders();
	 headers.add("Content-type", MediaType.APPLICATION_JSON_UTF8_VALUE);
	 return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(PwMapping), headers, HttpStatus.OK);
     }
     
     
		 
     // 회원가입 할때에 아이디 중복 ,로그인할때에 로그인 아이디 확인
	 @ResponseBody 
	 @RequestMapping(value="/IdCheck", method = RequestMethod.POST)
     public int IdCheck(MainVO VO) throws Exception {
	 log.info("POST IdCheck");
	 int IdCheck = service.oneteam_idCHeck(VO);
	 return IdCheck;
	 }	 
	 // 회원가입 할때에 이메일 중복 
	 @ResponseBody
	 @RequestMapping(value="/emailCheck", method = RequestMethod.POST)
	 public int emailCheck(MainVO VO) throws Exception {
	 log.info("POST emailCheck");
	 int emailCheck = service.oneteam_emailCheck(VO);
	 return emailCheck;
	 }
	 // 로그인할때에 이메일 인증 확인
	 @ResponseBody
     @RequestMapping(value="/Email_Success_Check", method = RequestMethod.POST)
	 public int Email_Success_Check(MainVO VO) throws Exception {
	 log.info("POST Email_Success_Check");
	 int emailCheck = service.oneteam_email_Success_Check(VO);
	 return emailCheck;
	 }
	 
	 
	 
	 // 아이디 찾기
	 @RequestMapping(value = "/find_id", method = RequestMethod.POST)
	 public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md
	 ,@RequestParam("userName") String userName) throws Exception{
	 md.addAttribute("id", service.oneteam_findId(response, email, userName));
			 
	 return "find_id2";
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
		 
		 
		 
	 //위도경도 json 파일 만들기
     @RequestMapping(value = "/sand", method = RequestMethod.POST)
	 public String address(addressDTO DTO,
	 HttpServletRequest request) throws Exception{
	 log.info("===========test===============");
	 service.insert_address(DTO);
	 jsonService.sand();
		 
	 return "main";
     }
}
