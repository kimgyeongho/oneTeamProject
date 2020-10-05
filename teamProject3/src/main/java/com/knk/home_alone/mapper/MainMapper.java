package com.knk.home_alone.mapper;


import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.knk.home_alone.domain.MainVO;



public interface MainMapper {
	 
	//회원가입   
	public void oneteam_join(MainVO VO)throws Exception;
	
	//로그인
	public MainVO oneteam_login(MainVO VO)throws Exception ;
	
	//주소 회원정보 수정
	public void oneteam_Update(MainVO VO)throws Exception;
	
	//주소 회원정보 수정
	public void oneteam_NumberUpdate(MainVO VO)throws Exception;
	
	//회원탈퇴
	public void oneteam_userDelete(MainVO vo)throws Exception;

	//비밀번호 회원정보 수정
	public void oneteam_PasswordUpdate(MainVO VO)throws Exception;
	
	//비밀번호 확인
	public MainVO oneteam_passwordCheck(MainVO VO) throws Exception;
	
	//아이디 중복
	public int oneteam_idCHeck(MainVO VO) throws Exception;
    
	//아이디 찾기
    public String oneteam_findId(@Param("email") String email, @Param("userName") String userName) throws Exception;


}