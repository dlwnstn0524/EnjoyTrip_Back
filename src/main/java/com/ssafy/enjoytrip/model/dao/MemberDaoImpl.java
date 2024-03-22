package com.ssafy.enjoytrip.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.ssafy.enjoytrip.dto.Member;
import com.ssafy.enjoytrip.exception.AuthenticationException;
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
		String sql = "insert into member(id, pw, email) "
				+ " values(?,?,?)";
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
	public void login(String id, String pw) throws Exception {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT uuid FROM member WHERE id=? and pw=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next()) {
			throw new AuthenticationException("로그인이 실패했습니다 다시 시도하세요.");
		}
	}

	@Override
	public void modifyMember(String id) {
		
		
	}

	@Override
	public void deleteMember(String id) {
		
	}

}
