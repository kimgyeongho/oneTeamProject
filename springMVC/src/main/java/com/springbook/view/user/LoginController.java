package com.springbook.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.userDAO;
import com.springbook.biz.user.impl.userServiceimpl;
@Controller
public class LoginController{
	@Autowired
	private userServiceimpl userService;
	
	public LoginController() {
		System.out.println("LoginController 빈 생성");
	}
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(UserVO vo,Model mnv) {
		if(vo.getId()==null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다");
		}
		if(vo!=null) {
			mnv.addAttribute("user",userService.getuser(vo));
			return"getBoardList.do";
		}else {
			return"login.jsp";
		}
	}
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String loginView(UserVO vo) {
		System.out.println("get");
		vo.setId("test");
		vo.setPw("pw");
		return "login.jsp";
	}

}
