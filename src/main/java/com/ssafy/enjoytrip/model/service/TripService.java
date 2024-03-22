package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;

public interface TripService {
	public void searchLocation();
	public void getAttractionList(int sidoCode, int contentTypeId);
	public List<Attraction> getAllSido();
}
