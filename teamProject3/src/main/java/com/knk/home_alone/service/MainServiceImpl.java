package com.knk.home_alone.service;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.mapper.MainMapper;

import lombok.extern.log4j.Log4j;



@Log4j
@Service("MainService")
public class MainServiceImpl implements MainService {

/*	@Setter(onMethod_ = @Autowired)
*/	@Autowired
	private MainMapper mainMapper;
	
	
	
	@Override
	public void userInsert(MainVO VO) throws Exception{
		log.info("userInsert" + VO);
		mainMapper.oneteam_join(VO);
	}



	@Override
	public MainVO oneteam_login(MainVO VO) throws Exception{
		log.info("oneteam_login"+VO);
		
		return mainMapper.oneteam_login(VO);
	}



	@Override
	public void oneteam_Update(MainVO VO) throws Exception {
		log.info("oneteam_Update"+VO);

		mainMapper.oneteam_Update(VO);
	}



	@Override
	public void oneteam_NumberUpdate(MainVO VO) throws Exception {
		log.info("oneteam_NumberUpdate"+VO);

		mainMapper.oneteam_NumberUpdate(VO);
	}



	@Override
	public void oneteam_PasswordUpdate(MainVO VO) throws Exception {
		log.info("oneteam_PasswordUpdate"+VO);

		mainMapper.oneteam_PasswordUpdate(VO);
	}



	@Override
	public void oneteam_userDelete(MainVO VO) throws Exception {
		log.info("userDelete"+VO);

		mainMapper.oneteam_userDelete(VO);
	}



	@Override
	public MainVO oneteam_passwordCheck(MainVO VO) throws Exception {
		log.info("oneteam_passwordCheck"+VO);
		MainVO  passwordCheck= mainMapper.oneteam_passwordCheck(VO);
		return passwordCheck;

	}



	@Override
	public int oneteam_idCHeck(MainVO VO) throws Exception {
		log.info("oneteam_idCHeck"+VO);
		int  IdCheck= mainMapper.oneteam_idCHeck(VO);
		return IdCheck;
	}

	@Override
	public int oneteam_emailCheck(MainVO VO) throws Exception {
		log.info("oneteam_emailCheck");
		int  emailCheck= mainMapper.oneteam_emailCheck(VO);
		return emailCheck;
		
	}
	
	

	@Override
	public String oneteam_findId(HttpServletResponse response, String email, String userName) throws Exception {
		log.info("oneteam_findId");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mainMapper.oneteam_findId(email, userName);

		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
		
	}



	@Override
	public MainVO oneteam_password_LoginCheck(MainVO VO) throws Exception {
		log.info("oneteam_password_LoginCheck"+VO);
		MainVO  passwordCheck2= mainMapper.oneteam_password_LoginCheck(VO);
		return passwordCheck2;
	}



	@Override
	public int oneteam_email_Success_Check(MainVO VO) throws Exception {
		log.info("oneteam_email_Success_Check"+VO);
		int  emailCheck= mainMapper.oneteam_email_Success_Check(VO);

		return emailCheck;
	}


	@Override
	public int oneteam_userCHeck(MainVO VO) throws Exception {
		int  userCheck= mainMapper.oneteam_userCHeck(VO);
		return userCheck;
	}

	
	
	}
