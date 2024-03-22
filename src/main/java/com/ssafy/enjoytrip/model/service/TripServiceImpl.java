package com.ssafy.enjoytrip.model.service;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;
import com.ssafy.enjoytrip.model.dao.TripDao;
import com.ssafy.enjoytrip.model.dao.TripDaoImpl;

public class TripServiceImpl implements TripService {
	
	private static TripDao tDao = TripDaoImpl.getInstance();
	private static TripService tripService = new TripServiceImpl();
	
	private TripServiceImpl() {
		super();
	}
	
	public static TripService getInstance() {
		return tripService;
	}

	@Override
	public void searchLocation() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Attraction> getAllSido() {
		return tDao.getAllSido();
	}

	@Override
	public List<Attraction> tripSearch(Attraction attraction) {
		// TODO Auto-generated method stub
		
		return tDao.getAttractionList(attraction);
	}

}
