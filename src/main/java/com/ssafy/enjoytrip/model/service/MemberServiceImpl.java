package com.ssafy.enjoytrip.model.service;

import com.ssafy.enjoytrip.dto.Member;
import com.ssafy.enjoytrip.model.dao.MemberDao;
import com.ssafy.enjoytrip.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService{

	
	private static MemberServiceImpl memberService = new MemberServiceImpl();
	private static MemberDao mDao = MemberDaoImpl.getInstance();

	private MemberServiceImpl() {
		super();
	}
	
	public static MemberServiceImpl getInstance() {
		return memberService;
	}

	
	@Override
	public void register(Member m) throws Exception{
		// TODO Auto-generated method stub
		mDao.register(m);
	}

	@Override
	public Member getMember(String id) throws Exception {
		// TODO Auto-generated method stub
		return mDao.getMember(id);
	}

	@Override
	public void login(String id, String pw) throws Exception{
		// TODO Auto-generated method stub
		mDao.login(id, pw);
	}

	@Override
	public void updateMember(Member m) throws Exception{
		// TODO Auto-generated method stub
		mDao.updateMember(m);
	}

	@Override
	public void deleteMember(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		mDao.deleteMember(id, pw);
	}

}
