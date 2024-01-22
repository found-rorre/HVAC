package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CarDAO;
import com.spring.dao.memberDAO;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarInfoList;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.memberDTO;

@Service
public class AdminRentalService {
	
	@Autowired
	CarDAO dao;
	
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

}
