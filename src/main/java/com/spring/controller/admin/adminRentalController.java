package com.spring.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.spring.dto.CarInfoList;
import com.spring.dto.CarList;
import com.spring.dto.RentalDTO;
import com.spring.service.RentalService;

@Controller
public class adminRentalController {

	private static final Logger logger = LoggerFactory.getLogger(adminRentalController.class);

	@Autowired
	RentalService service;
	@Autowired
	CarList carList;
	@Autowired
	CarInfoList infoList;	


	
	
//	rentalList
	@RequestMapping(value = "/admin/rentalList", method = RequestMethod.GET)
	public String rentalList(Model model) {
		System.out.println("adminRental의 rentalList");
		ArrayList<RentalDTO> rentalList = service.getRentalList(); 
		
		System.out.println(rentalList);
		
		model.addAttribute("rentalList", rentalList);
		return "admin/rentalList";
	}
	
	
//	랜트차량 조회 ( 월별 month, 연별 year )
	@RequestMapping(value = "/admin/rentalList/month", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> rentListMonth(@RequestBody Map<String, Object> data) {
		System.out.println("adminRental의 rentListMonth");
		System.out.println(data); // ( year, month ) or year
		
		ArrayList<RentalDTO> rentalList = service.rentListMonth(data);
		
		System.out.println(rentalList);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(rentalList);
			map.put("result", "success");
			map.put("rentalList", jsonString);
		} catch (Exception e) { }
		
		return map;
	}
	
//	매출조회 ( 월별 month, 연별 year )
	@RequestMapping(value = "/admin/income", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> income(@RequestBody Map<String, Object> data) {
		System.out.println("adminRental의 income");
		System.out.println(data); // type, year, month
		
		
		int income = service.income(data);
		System.out.println(income);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("income",Integer.toString(income));
		
		return map;
	}
//	매출조회 ( 올해 월단위로 )
	@RequestMapping(value = "/rental/incomeList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> yearlyIncome() {
		System.out.println("adminRental의 income");
		
		List<Map<String, Integer>> incomeList = service.incomeList();
		
		System.out.println(incomeList);
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(incomeList);
			map.put("result", "success");
			map.put("incomeList", jsonString);
		} catch (Exception e) { }
		
		return map;
	}
	
	
}
