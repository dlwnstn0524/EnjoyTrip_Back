package com.ssafy.enjoytrip.model.dao;

public interface MemberDao {
	public void register();
	public void myPage();
	public void login();
	public void modifyMember(String id);
	public void deleteMember(String id);
}
