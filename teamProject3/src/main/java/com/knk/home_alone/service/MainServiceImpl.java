package com.knk.home_alone.service;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.mapper.MainMapper;

import lombok.extern.log4j.Log4j;



@Log4j
@Service
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
	public String oneteam_findId(HttpServletResponse response, String email, String userName) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mainMapper.oneteam_findId(email, userName);

		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
		
	}


	// 이메일 보내기
	@Override
	public void send_mail(MainVO VO,String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "2018food@naver.com";
		String hostSMTPpwd = "oneteam123";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "2018fodd@naver.com";
		String fromName = "knk";
		String subject = "이메일 서비스";
		String msg = "";
		if(div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += VO.getUserID() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += VO.getUserPW()+ "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = VO.getEmail();
		try {
			//사용하기 위해선 pom.xml에 메일관련 api 설정해줘야한다.
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();

		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}



	@Override
	public void find_pw(HttpServletResponse response, MainVO VO) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
					// 임시 비밀번호 생성
					String pw = "";
					for (int i = 0; i < 12; i++) {
						pw += (char) ((Math.random() * 26) + 97);
					}
					VO.setUserPW(pw);
					// 비밀번호 변경
					mainMapper.update_pw(VO);
					// 비밀번호 변경 메일 발송
					send_mail(VO, "find_pw");
					
					out.print("이메일로 임시 비밀번호를 발송하였습니다.");
					out.close();
				
			}



	}
