package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;

public interface TripService {
	public void searchLocation();
	public List<Attraction> tripSearch(Attraction attraction);
	public List<Attraction> getAllSido();
}
