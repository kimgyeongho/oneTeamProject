package com.springbook.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserVO;

@Service("userService")
public class userServiceimpl implements UserService{
	@Autowired
	private UserDAOMybatis userdao;
	

	public userServiceimpl() {
		System.out.println("userimpl생성");
	}



	public UserVO getuser(UserVO vo) {
		System.out.println("getuser 메소드 실행");
		return 
		userdao.getuser(vo);
	}

}
