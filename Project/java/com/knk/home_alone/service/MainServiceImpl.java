package com.knk.home_alone.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.FileVO;
import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.domain.addressDTO;
import com.knk.home_alone.domain.boardVO;
import com.knk.home_alone.mapper.MainMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("MainService")
public class MainServiceImpl implements MainService {

	/* @Setter(onMethod_ = @Autowired) */ // 둘다 똑같은 방법
	@Autowired
	private MainMapper mainMapper;

	// 회원가입
	@Override
	public void userInsert(MainVO VO) throws Exception {
		log.info("userInsert" + VO);
		mainMapper.oneteam_join(VO);
	}

	// 로그인
	@Override
	public MainVO oneteam_login(MainVO VO) throws Exception {
		log.info("oneteam_login" + VO);
		return mainMapper.oneteam_login(VO);
	}

	// 주소 회원정보 수정
	@Override
	public void oneteam_Update(MainVO VO) throws Exception {
		log.info("oneteam_Update" + VO);

		mainMapper.oneteam_Update(VO);
	}

	// 주소 회원정보 수정
	@Override
	public void oneteam_NumberUpdate(MainVO VO) throws Exception {
		log.info("oneteam_NumberUpdate" + VO);

		mainMapper.oneteam_NumberUpdate(VO);
	}

	// 비밀번호 회원정보 수정
	@Override
	public void oneteam_PasswordUpdate(MainVO VO) throws Exception {
		log.info("oneteam_PasswordUpdate" + VO);

		mainMapper.oneteam_PasswordUpdate(VO);
	}

	// 회원탈퇴
	@Override
	public void oneteam_userDelete(MainVO VO) throws Exception {
		log.info("userDelete" + VO);

		mainMapper.oneteam_userDelete(VO);
	}

	// 비밀번호 확인
	@Override
	public MainVO oneteam_passwordCheck(MainVO VO) throws Exception {
		log.info("oneteam_passwordCheck" + VO);
		MainVO passwordCheck = mainMapper.oneteam_passwordCheck(VO);
		return passwordCheck;

	}

	// 아이디 중복
	@Override
	public int oneteam_idCHeck(MainVO VO) throws Exception {
		log.info("oneteam_idCHeck" + VO);
		int IdCheck = mainMapper.oneteam_idCHeck(VO);
		return IdCheck;
	}

	// 이메일 중복
	@Override
	public int oneteam_emailCheck(MainVO VO) throws Exception {
		log.info("oneteam_emailCheck");
		int emailCheck = mainMapper.oneteam_emailCheck(VO);
		return emailCheck;

	}

	// 아이디 찾기
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

	// 로그인 할때 비밀번호 확인
	@Override
	public MainVO oneteam_password_LoginCheck(MainVO VO) throws Exception {
		log.info("oneteam_password_LoginCheck" + VO);
		MainVO passwordCheck2 = mainMapper.oneteam_password_LoginCheck(VO);
		return passwordCheck2;
	}

	// 로그인 이메일 인증 성공했는지 체크
	@Override
	public int oneteam_email_Success_Check(MainVO VO) throws Exception {
		log.info("oneteam_email_Success_Check" + VO);
		int emailCheck = mainMapper.oneteam_email_Success_Check(VO);

		return emailCheck;
	}

	// 비밀번호 찾기 유저정보 체크하기
	@Override
	public int oneteam_userCHeck(MainVO VO) throws Exception {
		int userCheck = mainMapper.oneteam_userCHeck(VO);
		return userCheck;
	}

	@Override
	public List<boardVO> getBoardList(boardVO vo) throws Exception{
		for(boardVO sd:mainMapper.getboardList(vo)) {
			System.out.println("게시판 정보들:"+sd);
		}
		
		return mainMapper.getboardList(vo);
		
	}

	@Override
	public boardVO getBoard(boardVO vo) {
		mainMapper.bodercot(vo);
		return mainMapper.getBoard(vo);
	}

	@Override
	public void insert_address(addressDTO dto) {
		mainMapper.insert_address(dto);
		
	}

	@Override
	public void boardupdate(boardVO vo) {
		mainMapper.boardupdate(vo);
	}

	@Override
	public void fileupdate(FileVO vo) {
		mainMapper.fileupdate(vo);
		
	}
	
}

