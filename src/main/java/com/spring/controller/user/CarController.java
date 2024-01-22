package com.spring.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class CarController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(CarController.class);
	
	@Autowired 
	CarService service;
	
	@Autowired
	CarDTO carDTO;
	
	@Autowired
	RentalDTO rentalDTO;
	
	
//	carList 페이지 이동
	@RequestMapping(value = "/car/carList", method = RequestMethod.GET)
	public String test(Model model) {
		System.out.println("car의 carList");
		
		return "user/carList";
	}

	
//	차량 1개의 정보를 가져온다.
	@RequestMapping(value = "/car/article", method = RequestMethod.POST)
	public String article(Model model, CarDTO carDTO) {
		System.out.println("Rental의 article");
		
		
		long timestamp = System.currentTimeMillis();
		Date rentalDate = new Date(timestamp);
		Date dueDate = new Date(timestamp + (1000 * 60 * 60 * 24));
		

		model.addAttribute("rentalDate", rentalDate);
		model.addAttribute("dueDate", dueDate);
		
		
		carDTO = service.selectByCarIdx(carDTO.getCar_idx());
		model.addAttribute("car", carDTO);
		
		return "user/carArticle";
	}
	 
//	차량 검색 POST
	@RequestMapping(value = "/car/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> search_post(Model model, @RequestBody CarParam carParam) {
		System.out.println("car의 search_post");
		
		CarList carList = service.mainSearchCar(carParam);
		
		Map<String, String> map = new HashMap<String, String>();


		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(carList);
			map.put("result", "success");
			map.put("carList", jsonString);
		} catch (Exception e) { }
		
		
		return map;
	}

//	차량 검색 GET
	@RequestMapping(value = "/car/search", method = RequestMethod.GET)
	public String search_get(HttpServletRequest request, Model model, CarParam carParam) {
		System.out.println("car의 search_get");
		
		List<String> fuel = new ArrayList<String>();
		List<String> type = new ArrayList<String>();
		List<String> seatCount = new ArrayList<String>();

//	차량 검색 옵션 데이터 가져오기
		int i = 0;
		while (request.getParameter("fuel"+i) != null) {
			fuel.add(request.getParameter("fuel"+i));
			i++;
		}
		
		i = 0;
		while (request.getParameter("type"+i) != null) {
			type.add(request.getParameter("type"+i));
			i++;
		}
		
		i = 0;
		while (request.getParameter("seatCount"+i) != null) {
			seatCount.add(request.getParameter("seatCount"+i));
			i++;
		}
		
		carParam.setFuel(fuel);
		carParam.setType(type);
		carParam.setSeatCount(seatCount);
		
		CarList carList = service.mainSearchCar(carParam);
		
		System.out.println(carList);
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(carList);
			jsonString = jsonString.replace("\"", "'");
			System.out.println(jsonString);
			model.addAttribute("carList_json", jsonString);
		} catch (Exception e) { }
		return "user/carList";
	}
	
	@RequestMapping(value = "/car/kwSearch", method = RequestMethod.GET)
	public String kwSearch(HttpServletRequest request, Model model) {
		System.out.println("car의 kwSearch");
		
		
		String keyword = request.getParameter("keyword");
		
		System.out.println(keyword);
		if(keyword == null) {
			return "redirect:/car/search";
		}
		CarList carList = service.keywordSearch(keyword);
		System.out.println(carList);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(carList);
			jsonString = jsonString.replace("\"", "'");
			System.out.println(jsonString);
			model.addAttribute("carList_json", jsonString);
		} catch (Exception e) { }
		
		return "user/carList";
	}

	
	
}