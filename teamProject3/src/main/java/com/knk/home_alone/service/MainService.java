package com.knk.home_alone.service;

import javax.servlet.http.HttpServletResponse;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.addressDTO;

public interface MainService {
    //회원가입 
	public void userInsert(MainVO VO) throws Exception;
	
	
	//로그인
	public MainVO oneteam_login(MainVO VO) throws Exception;
	
	
	//마이페이지 주소 회원정보 수정
	public void oneteam_Update(MainVO VO)throws Exception;
	//마이페이지  폰 번호 수정 
	public void oneteam_NumberUpdate(MainVO VO)throws Exception;
	//마이페이지 비밀번호 회원정보 수정
	public void oneteam_PasswordUpdate(MainVO VO)throws Exception;
	//마이페이지 회원탈퇴
	public void oneteam_userDelete(MainVO VO)throws Exception;

	
	//로그인페이지,회원가입페이지 아이디 중복
	public int oneteam_idCHeck(MainVO VO) throws Exception;
	//회원가입페이지 이메일 중복
	public int oneteam_emailCheck(MainVO vO) throws Exception;
	
	
	//아이디 찾기 
    public String oneteam_findId(HttpServletResponse response, String email, String userName) throws Exception;
	//비밀번호 찾기 유저정보 체크하기 
	public int oneteam_userCHeck(MainVO VO) throws Exception;	
	
	
	
	//로그인 할때 비밀번호 확인
	public MainVO oneteam_password_LoginCheck(MainVO VO) throws Exception;
	//로그인 이메일 인증 성공했는지 체크
	public int oneteam_email_Success_Check(MainVO VO) throws Exception;
	
	
	// 위도경도 테스트중 
	public void insert_address(addressDTO DTO) throws Exception;
}
