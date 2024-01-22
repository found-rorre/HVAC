package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
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
public class AdminCarService {
	
	@Autowired
	CarDAO dao;

	public void carDelete(HashMap<String, Object> data) {
		dao.carDelete(data);
		
	}
	

}
