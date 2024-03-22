package com.ssafy.enjoytrip.model.dao;

import com.ssafy.enjoytrip.dto.Member;

public interface MemberDao {
	public void register(Member m) throws Exception;
	public void myPage() throws Exception;
	public void login() throws Exception;
	public void modifyMember(String id) throws Exception;
	public void deleteMember(String id) throws Exception;
}
