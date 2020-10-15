package com.springbook.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;
@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getuser(UserVO vo) {
		System.out.println("유저마이바티스");
		return mybatis.selectOne("userDAO.getuser",vo);
	}

}
