package com.ssafy.enjoytrip.dto;

public class Member {
	private int uuid; 
	private String id;
	private String pw;
	private String email;
	private String name;
	
	public int getUuid() {
		return uuid;
	}
	
	public Member() {
		super();
	}

	public Member(String id, String pw, String email, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Member [uuid=" + uuid + ", id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + "]";
	}
	
	
}
