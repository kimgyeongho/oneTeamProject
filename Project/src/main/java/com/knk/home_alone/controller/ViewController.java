package com.knk.home_alone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewController {
	// 메인화면 창
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		log.info("maie! GET");
		return "main";
	}

	// 마이페이지 GET
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public void mypage() throws Exception {
		log.info("GET mypage");
	}

	// 아이디 찾기 페이지 GET
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public void getFind_id() throws Exception {
		log.info("GET find_id");
	}

	// 비밀번호 찾기 페이지 GET
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.GET)
	public void getFind_pw() throws Exception {
		log.info("GET find_pw");
	}

	// 임시적인 창 띄우기 게시판
	@RequestMapping(value = "/board_all.do")
	public void board_all() {

	}
	@RequestMapping(value = "/boardWrite.do")
	public void boardWrite() {
		
	}

	// 임시적인 창 띄우기 지도
	@RequestMapping(value = "/map.do")
	public void map() {

	}

	// 임시적인 창 띄우기 회원가입 언어선택
	@RequestMapping(value = "/authentication.do")
	public void authentication() {

	}
	@RequestMapping(value = "/signup.do")
	public void signupko() {

	}
	@RequestMapping(value = "/signupENG.do")
	public void signupENG() {

	}
}
