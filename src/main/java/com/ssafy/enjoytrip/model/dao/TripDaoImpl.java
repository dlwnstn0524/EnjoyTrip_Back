package com.ssafy.enjoytrip.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;
import com.ssafy.util.DBUtil;

public class TripDaoImpl implements TripDao{
	
	private static TripDao tripDao = new TripDaoImpl();
	
	private TripDaoImpl() {
		super();
	}
	
	public static TripDao getInstance() {
		return tripDao;
	}

	@Override
	public List<Attraction> getAllSido() {
		List<Attraction> list = new ArrayList<>();
		try {
			Connection conn = DBUtil.getConnection();
			String sql = "select *"
					+ " from sido";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Attraction(Integer.parseInt(rs.getString("sido_code")), rs.getString("sido_name")));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Attraction> getAttractionList(Attraction dto) {
		List<Attraction> list = new ArrayList<>();
		try {
			Connection conn = DBUtil.getConnection();
			String sql = "select *"
					+ " from attraction_info"
					+ " where content_type_id = ? and sido_code = ? and title like ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getContentTypeId());
			pstmt.setInt(2, dto.getSidoCode());
			pstmt.setString(3, "%" + dto.getTitle() + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Attraction(rs.getInt("content_id"),
						rs.getInt("content_type_id"),
		                rs.getString("title"),
		                rs.getString("addr1"),
		                rs.getString("first_image"),
		                rs.getInt("sido_code"),
		                rs.getInt("gugun_code"), 
		                rs.getString("latitude"), 
		                rs.getString("longitude")));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
