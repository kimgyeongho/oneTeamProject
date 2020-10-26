package com.knk.home_alone.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class BoardVO {
	private int seq;
	private String title;
	private String content_character;
	private String content_character2;
	private String userID;
	private String content;
	private String address;
	private Date regDate;
	private int cnt;
	private String serchKeyword;
	private Double lat;
	private Double lng;
	public void setSerchKeyword(String serchKeyword) {
		this.serchKeyword = "%"+serchKeyword+"%";
	}
}
