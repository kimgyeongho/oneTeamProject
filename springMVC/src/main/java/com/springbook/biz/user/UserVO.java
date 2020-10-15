package com.springbook.biz.user;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String role;
	
	public UserVO() {
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "userVO [id=" + id + ", pw=" + pw + ", name=" + name + ", role=" + role + "]";
	}
	

}
