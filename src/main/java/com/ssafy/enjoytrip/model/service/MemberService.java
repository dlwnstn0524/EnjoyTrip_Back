package com.ssafy.enjoytrip.model.service;

import com.ssafy.enjoytrip.dto.Member;

public interface MemberService {
	public void register(Member m) throws Exception;
	public Member getMember(String id) throws Exception;
	public void login(String id, String pw) throws Exception;
	public void updateMember(Member m) throws Exception;
	public void deleteMember(String id, String pw) throws Exception;
}
