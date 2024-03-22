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
		String sql = "insert into member(id, pw, email, name) "
				+ " values(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.getId());
		pstmt.setString(2, m.getPw());
		pstmt.setString(3, m.getEmail());
		pstmt.setString(4, m.getName());
		pstmt.executeUpdate();
		conn.close();	
	}

	@Override
	public Member getMember(String id) throws Exception {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM member WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		Member m = new Member();
		m.setId(rs.getString("id"));
		m.setEmail(rs.getString("email"));
		m.setName(rs.getString("name"));
		return m;
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
	public void updateMember(Member m) throws Exception {
		Connection conn = DBUtil.getConnection();
		String sql = "UPDATE member SET pw=?, email=?, name=? where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.getPw());
		pstmt.setString(2, m.getEmail());
		pstmt.setString(3, m.getName());
		pstmt.setString(4, m.getId());
		
		pstmt.executeUpdate();
	}

	@Override
	public void deleteMember(String id) {
		
	}

}
