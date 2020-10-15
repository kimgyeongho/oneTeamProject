package com.springbook.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;

public class test {
	public test() {
//		System.out.println("테스트 빈 만들어놔야징");
	}
	public Object Log(ProceedingJoinPoint pj) throws Throwable {
//		System.out.println("뺏어왕"+pj.proceed());
		System.out.println(pj+"1");
		Object ret = pj.proceed();
		System.out.println(ret.toString());
//		System.out.println(pj.proceed().toString()+"2");
//		System.out.println("뺏어다가 실행했다가");
		return ret;
		
	}

}
