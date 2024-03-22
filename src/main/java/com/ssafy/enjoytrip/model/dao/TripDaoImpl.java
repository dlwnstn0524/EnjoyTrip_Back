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

}
