package com.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.RentalDAO;
import com.spring.dto.CarDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.memberDTO;

@Service
public class RentalService {
	
	@Autowired
	RentalDAO dao;
	
	@Autowired
	CarDTO carDTO;
	
	@Autowired
	CarList carList;
	
	public void rentalInsert(Map<String, Object> data) {
		System.out.println("RentalService의 rentalInsert");
		System.out.println(data);
		dao.rentalInsert(data);
	}

	public ArrayList<RentalDTO> getRentalList() {
		System.out.println("RentalService의 getRentalList");
		
		return dao.getRentalList();
	}

	public ArrayList<RentalDTO> rentListMonth(Map<String, Object> data) {
		System.out.println("RentalService의 rentListMonth");
		
		return dao.rentListMonth(data);
	}

	public int income(Map<String, Object> data) {
		System.out.println("RentalService의 income");
		Integer result = dao.income(data);
		result = (result != null) ? result : 0;
		return result;
	}

	public List<Map<String, Integer>> incomeList() {
		return dao.incomeList();
	}



	
	
	
	
}
