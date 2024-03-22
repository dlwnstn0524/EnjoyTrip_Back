package com.ssafy.enjoytrip.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ssafy.enjoytip.dto.Member;
import com.ssafy.util.DBUtil;

public class MemberDaoImpl implements MemberDao{
	
	private static MemberDaoImpl memberDao = new MemberDaoImpl();

	private MemberDaoImpl() {
		super();
	}
	
	public static MemberDaoImpl getInstance() {
		return memberDao;
	}

	@Override
	public void register(Member m) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into members(id, pw, email) "
				+ " values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.getId());
		pstmt.setString(2, m.getPw());
		pstmt.setString(3, m.getEmail());
		pstmt.executeUpdate();
		conn.close();	
	}

	@Override
	public void myPage() {
		
		
	}

	@Override
	public void login() {
		
		
	}

	@Override
	public void modifyMember(String id) {
		
		
	}

	@Override
	public void deleteMember(String id) {
		
	}

}
