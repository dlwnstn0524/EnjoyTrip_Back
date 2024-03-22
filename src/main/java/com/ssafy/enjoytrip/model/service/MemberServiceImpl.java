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
	public void myPage() throws Exception{
		// TODO Auto-generated method stub
		mDao.myPage();
	}

	@Override
	public void login() throws Exception{
		// TODO Auto-generated method stub
		mDao.login();
	}

	@Override
	public void modifyMember(String id) throws Exception{
		// TODO Auto-generated method stub
		mDao.modifyMember(id);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		// TODO Auto-generated method stub
		mDao.deleteMember(id);
	}

}
