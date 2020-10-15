package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;

import com.springbook.biz.user.UserVO;

public class AfterReturningAdvice {
	public void afterLog(JoinPoint jp,Object returnObj) {
		String s=jp.getSignature().getName();
		if(returnObj instanceof UserVO) {
			UserVO user =(UserVO) returnObj;
			if(user.getRole().equals("ggg")) {
				System.out.println(user.getName()+"로그인(Admin)");
			}
		}
		
		System.out.println("[사후처리]"+s+"메소트 리턴값:"+returnObj.toString());
	}
	
}
