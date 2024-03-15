package com.spring.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dto.CarDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.memberDTO;
import com.spring.service.CarService;
import com.spring.service.RentalService;

@Controller
public class RentalController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	
	@Autowired 
	RentalService service;
	
	@Autowired 
	CarService carService;
	
	@Autowired
	CarList carList;
	
	@Autowired
	CarDTO carDTO;

	@Autowired
	RentalDTO rentalDTO;

	@RequestMapping(value = "/rental/rental", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> rental(Model model, HttpSession session, @RequestBody Map<String, Object> data) {
		System.out.println("Rental의 rental");
		
		String memberID = (String) session.getAttribute("memberID");
		System.out.println(memberID);
		data.put("memberID", memberID);
		
//		차량 출고로 변경
		carService.carUpdate((int) data.get("car_idx"), "출고");
		
		service.rentalInsert(data);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
	
}