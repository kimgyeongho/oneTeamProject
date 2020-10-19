package com.knk.home_alone.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.addressDTO;
import com.knk.home_alone.domain.boardVO;



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
	//로그인 할때 비밀번호 확인
	public MainVO oneteam_password_LoginCheck(MainVO VO) throws Exception;
	//아이디 중복
	public int oneteam_idCHeck(MainVO VO) throws Exception;
	//이메일 중복
	public int oneteam_emailCheck(MainVO vO) throws Exception;
	//아이디 찾기
    public String oneteam_findId(@Param("email") String email, @Param("userName") String userName) throws Exception;
	//회원 인증키(난수) 생성    MailSendService.java
	public void getKey(String userID, String key);
	//회원 인증키(난수) Certified로 변경    MailSendService.java
	public int alter_userKey(String userID, String key);
	//로그인 이메일 인증 성공했는지 체크
	public int oneteam_email_Success_Check(MainVO VO) throws Exception;
    //임시 비밀번호   MailSendService.java
	public int temporary_password(String userName, String userID , String email, String key) throws Exception;
	//아이디로 유저이름 찾기  MailSendService.java
	public MainVO oneteam_userName(@Param("userName") String userName,@Param("userID") String userID,@Param("email") String email) throws Exception;
	//비밀번호 찾기 유저정보 체크하기 
	public int oneteam_userCHeck(MainVO vO) throws Exception;
	public List<boardVO> getboardList(boardVO vo)throws Exception;
	public boardVO getBoard(boardVO vo);
	public void  bodercot(boardVO vo);
	public void insert_address(addressDTO dto);
}