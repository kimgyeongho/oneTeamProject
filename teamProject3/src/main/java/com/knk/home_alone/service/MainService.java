package com.knk.home_alone.service;

import com.knk.home_alone.domain.MainVO;

public interface MainService {
  
	public void userInsert(MainVO VO) throws Exception;
	
	public MainVO oneteam_login(MainVO VO) throws Exception;
	
	public void oneteam_Update(MainVO VO)throws Exception;

	public void oneteam_NumberUpdate(MainVO VO)throws Exception;

	public void oneteam_PasswordUpdate(MainVO VO)throws Exception;
	
	public void oneteam_userDelete(MainVO VO)throws Exception;

	public int oneteam_passwordCheck(MainVO VO) throws Exception;

	public int oneteam_idCHeck(MainVO VO) throws Exception;

}
