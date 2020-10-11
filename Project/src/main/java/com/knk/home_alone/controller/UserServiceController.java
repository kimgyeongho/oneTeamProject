package com.knk.home_alone.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.knk.home_alone.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserServiceController {
	@Autowired 
	private MainService service;

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
}
