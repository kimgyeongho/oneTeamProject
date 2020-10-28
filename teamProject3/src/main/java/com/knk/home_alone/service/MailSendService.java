package com.knk.home_alone.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.mapper.MainMapper;

@Service
public class MailSendService {

	@Autowired  //메일 보내기
	private JavaMailSender mailSender;
	@Autowired //구글 아이디 값 
	private MainMapper mainMapper;
	@Autowired // 비밀번호 암호화
	private PasswordEncoder pwencoder;

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailKey(String email, String userID, HttpServletRequest request) {
		
		String key = getKey(false, 10);
		mainMapper.getKey(userID, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h1>안녕하세요   나 홀로집에입니다!</h1><br>" 
				+ "<h3>" + userID + "님</h3>" + "<p>인증 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8080" + request.getContextPath() + "/key_alter?userID="+ userID +"&user_key="+key+"'>인증</a></p>"
				+ "(잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("이메일 인증 서비스 나 홀로집에 ", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
		public int alterKeyService(String userID, String key) {
		
		int resultCnt = 0;
		
		resultCnt = mainMapper.alter_userKey(userID, key);
		
		return resultCnt;
	}
		// 패스워드 찾기 이메일 발송
		public void mailPassword(String userName,String userID, String email, HttpServletRequest request) throws Exception {
			// 비밀번호는 7자리로 보내고 데이터베이스 비밀번호를 바꿔준다
			String key = getKey(false, 7);			
			// 회원 이름 꺼내는 코드
			MainVO vo = mainMapper.oneteam_userName(userName,userID,email);
			String name = vo.getUserName();
					
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h1>안녕하세요 '"+ name +"' 님</h1><br><br>" 
					+ "<h4>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</h4>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost:8080/login.do'> 로그인 페이지 접속하기</a></h3><br><br>"
					+ "(잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			// 비밀번호 암호화해주는 메서드
			key = pwencoder.encode(key);
			// 데이터 베이스 값은 암호한 값으로 저장시킨다.
			mainMapper.temporary_password(userName,userID, email, key);
		}
		
		
	}
