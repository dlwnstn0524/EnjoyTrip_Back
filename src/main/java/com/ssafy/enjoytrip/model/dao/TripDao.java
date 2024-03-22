package com.ssafy.enjoytrip.model.dao;

import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;

public interface TripDao {
	public List<Attraction> getAllSido();
	public List<Attraction> getAttractionList(Attraction attraction);
}
