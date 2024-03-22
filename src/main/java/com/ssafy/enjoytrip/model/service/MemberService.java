package com.ssafy.enjoytrip.model.service;

public interface MemberService {
	public void register();
	public void myPage();
	public void login();
	public void modifyMember(String id);
	public void deleteMember(String id);
}
