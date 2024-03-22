package com.ssafy.enjoytrip.dto;

public class Member {
	private int uuid; 
	private String id;
	private String pw;
	private String email;
	
	public int getUuid() {
		return uuid;
	}

	public Member(String id, String pw, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
