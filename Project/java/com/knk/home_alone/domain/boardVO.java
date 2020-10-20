package com.knk.home_alone.domain;



import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class boardVO {
	private int seq;
	private String title;
	private String content_character;
	private String writer;
	private String content;
	private String address;
	private Date regDate;
	private int cnt;
	private String serchKeyword;
	private MultipartFile uploadFile;
	private double lat;
	private double lng;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent_character() {
		return content_character;
	}
	public void setContent_character(String content_character) {
		this.content_character = content_character;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSerchKeyword() {
		return serchKeyword;
	}
	public void setSerchKeyword(String serchKeyword) {
		this.serchKeyword = serchKeyword;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "boardVO [seq=" + seq + ", title=" + title + ", content_character=" + content_character + ", writer="
				+ writer + ", content=" + content + ", address=" + address + ", regDate=" + regDate + ", cnt=" + cnt
				+ ", serchKeyword=" + serchKeyword + ", uploadFile=" + uploadFile + ", lat=" + lat + ", lng=" + lng
				+ "]";
	}
	

}
