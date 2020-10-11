package com.knk.home_alone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewController {

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
}
