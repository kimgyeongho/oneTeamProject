package com.knk.home_alone.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName;  //파일의 이름 
	private String uploadPath;  //업로드 경로
	private String uuid;   //uuid 값
	private boolean image;  //이미지 여부 

}
