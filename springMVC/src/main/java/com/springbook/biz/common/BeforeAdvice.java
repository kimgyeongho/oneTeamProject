package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
	public void beforLog(JoinPoint jp) {
		String s=jp.getSignature().getName();
		Object[] a=jp.getArgs();
		
		System.out.println("[사전처리]"+s+"()메소드ARGS정보:"+a[0].toString());
	}
	
}
