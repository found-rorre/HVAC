package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CarDAO;
import com.spring.dao.memberDAO;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.memberDTO;

@Service
public class CarService {
	
	@Autowired
	CarDAO dao;
	
	@Autowired
	CarDTO carDTO;
	
	@Autowired
	CarList carList;

	public CarDTO selectByCarIdx(int car_idx) {
		System.out.println("RentalService의 selectByCarIdx");
		
		carDTO = dao.selectByCarIdx(car_idx);
		return carDTO;
	}

	public CarList mainSearchCar(CarParam carParam) {
		System.out.println("RentalService의 mainSearchCar");
		
		List<String> seatCount = carParam.getSeatCount();
		
		if(seatCount == null || seatCount.size() == 0 || seatCount.size() == 2) {
			carParam.setSeatCount(null);
		}
		carList.setList(dao.mainSearchCar(carParam));
		return carList;
	}
	
	
	
	public void carDelete(HashMap<String, Object> data) {
		dao.carDelete(data);
	}
	
	public ArrayList<CarDTO> getlist() {
		System.out.println("AdminRentalService의 getlist");
		
		return dao.getlist();
	}

	public ArrayList<CarInfoDTO> getCarInfo() {
		return dao.getCarInfo();
	}

	public CarInfoDTO getSelectedCarinfo(int idx) {
		
		return dao.getSelectedCarinfo(idx);
	}

	public void carinfoInsert(CarInfoDTO carInfoDTO) {
		dao.carinfoInsert(carInfoDTO);
	}

	public void carInsert(CarDTO carDTO) {
		dao.carInsert(carDTO);
		
	}
	public void carInfoDelete(String data) {
		int carInfo_idx = Integer.parseInt(data);
		dao.carInfoDelete(carInfo_idx);
	}

	public List<Map<String, Integer>> statusCount() {
		
		return dao.statusCount();
	}

	public List<String> getTypeList() {
		return dao.getTypeList();
	}

	public List<String> getMakerList() {
		return dao.getMakerList();
	}

	public void carUpdate(int car_idx, String status) {
		carDTO.setCar_idx(car_idx);
		carDTO.setStatus(status);
		
		dao.carUpdate(carDTO);
	}

	public void adminCarUpdate(HashMap<String, Object> data) {
		dao.adminCarUpdate(data);
	}

	public CarList keywordSearch(String keyword) {
		carList.setList(dao.keywordSearch(keyword));
		
		return carList;
	}

	

}
