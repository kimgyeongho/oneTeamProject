package com.springbook.biz.board;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserService;
import com.springbook.biz.user.impl.userDAO;

public class userServiceClient {

	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService) container.getBean("userService");
		UserVO vo = new UserVO();
		vo.setId("id");
		vo.setPw("pw");
		UserVO user = userService.getuser(vo);
		System.out.println(user.toString()+"입니당당");
		if (user != null) {
			System.out.println(user.getName() + "로그ㅜ인성공");
		} else {
			System.out.println("로그인실패");
		}

		container.close();
	}

}
