package com.knk.home_alone.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.MainVO;
import com.knk.home_alone.mapper.MainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Log4j
@Service("MainService")
public class MainServiceImpl implements MainService {

	@Setter(onMethod_ = @Autowired)
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
	public int oneteam_passwordCheck(MainVO VO) throws Exception {
		log.info("oneteam_passwordCheck"+VO);
		int  passwordCheck= mainMapper.oneteam_passwordCheck(VO);
		return passwordCheck;

	}



	@Override
	public int oneteam_idCHeck(MainVO VO) throws Exception {
		log.info("oneteam_idCHeck"+VO);
		int  IdCheck= mainMapper.oneteam_idCHeck(VO);
		return IdCheck;
	}
	

	
}