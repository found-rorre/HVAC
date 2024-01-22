package com.spring.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarInfoList;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.service.CarService;
import com.spring.service.RentalService;
import com.spring.service.adminUserService;

@Controller
public class adminCarController {

	private static final Logger logger = LoggerFactory.getLogger(adminCarController.class);

	@Autowired
	CarService service;
	@Autowired
	CarList carList;
	@Autowired
	CarInfoList infoList;	
	@RequestMapping(value = "/admin/carUpdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> carUpdate(@RequestBody HashMap<String, Object> data) {
		System.out.println("adminCar의 carUpdate");
		
		service.adminCarUpdate(data);

		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
//	Car 삭제
	@RequestMapping(value = "/admin/carDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> carDelete(@RequestBody HashMap<String, Object> data) {
		System.out.println("adminCar의 carDelete");
		
		service.carDelete(data);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
//	info 삭제
	@RequestMapping(value = "/admin/carInfoDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> carInfoDelete(@RequestBody String data) {
		System.out.println("adminCar의 carInfoDelete");
		
		service.carInfoDelete(data);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
//	carList 전체 조회
	@RequestMapping(value = "/admin/carList", method = RequestMethod.GET)
	public String getCarList(Model model) {
		System.out.println("adminCar의 getCarList");
		
		carList.setList(service.getlist());
		
		model.addAttribute("carList", carList);
		return "admin/carList";
	}
	
//	info 전체 조회
	@RequestMapping(value = "/admin/carinfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> carinfo() {
		System.out.println("adminRental의 carinfo");
		
		infoList.setList(service.getCarInfo());
		Map<String, String> map = new HashMap<String, String>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(infoList);
			map.put("result", "success");
			map.put("infoList", jsonString);
		} catch (Exception e) { }
		return map;
	}
	
//	선택된 info 1건 조회
	@RequestMapping(value = "/admin/selectedCarinfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> selectedCarinfo(@RequestBody String data) {
		System.out.println("adminCar의 selectedCarinfo");
		int idx = Integer.parseInt(data);
		CarInfoDTO carInfoDTO = service.getSelectedCarinfo(idx);
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(carInfoDTO);
			map.put("result", "success");
			map.put("carInfo", jsonString);
		} catch (Exception e) { }
		return map;
	}
	
//	차량상태조회 ( 수정중 )
	@RequestMapping(value = "/car/statusCount", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> statusCount() {
		System.out.println("adminCar의 statusCount");
		
		
		List<Map<String, Integer>> statusList = service.statusCount();
		
		System.out.println(statusList);
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(statusList);
			map.put("result", "success");
			map.put("statusList", jsonString);
		} catch (Exception e) { }
		
		
		
		return map;
	}
	
//	렌트 Type Maker 조회 ( option list )
	@RequestMapping(value = "/admin/car/typeOption", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> typeOption() {
		System.out.println("adminCar의 typeOption");
		
		List<String> typeList = service.getTypeList();
		List<String> makerList = service.getMakerList();
		
		System.out.println(typeList);
		System.out.println(makerList);
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String typeListString  = objectMapper.writeValueAsString(typeList);
			String makerListString = objectMapper.writeValueAsString(makerList);
			map.put("result", "success");
			map.put("typeList", typeListString);
			map.put("makerList", makerListString);
		} catch (Exception e) { }
		
		return map;
	}
	
	
	
	
	
//	carInfo insert
	@RequestMapping(value = "admin/infoInsert", method = RequestMethod.POST)
	public void infoInsert(MultipartHttpServletRequest request, Model model, CarInfoDTO carInfoDTO) {
		System.out.println("adminCar의 infoInsert");
		System.out.println(carInfoDTO);
		
		
		String rootUplordDir = "C:" + File.separator + "upload" + File.separator + "rentCar"; // C:/upload/rentCar
		System.out.println(rootUplordDir);
		Iterator<String> iterator = request.getFileNames();
		
		MultipartFile multipartFile = null;
		String uploadFilename = iterator.next();
		System.out.println(uploadFilename);
		multipartFile = request.getFile(uploadFilename);
		
		// 파일 이름 생성
		String originalName = multipartFile.getOriginalFilename();
		System.out.println(originalName);
		String image = uploadFile(originalName);
		System.out.println(image);
		 if(originalName != null && originalName.length() != 0) {

			 try {
				 multipartFile.transferTo(new File(rootUplordDir + File.separator + image));
			 } catch (IllegalStateException e) {	} catch (IOException e) {}
			 
		 } else {
		    	image = "car.jpg";
		 }
		 System.out.println(image);
		 carInfoDTO.setImage(image);
		
		service.carinfoInsert(carInfoDTO);
	}
	
//	car insert
	@RequestMapping(value = "admin/carInsert", method = RequestMethod.POST)
	public void carInsert(Model model, CarDTO carDTO) {
		System.out.println("adminRental의 carInsert");
		System.out.println(carDTO);
		
		service.carInsert(carDTO);
	}
	
//	랜던파일이름 생성 메서드
	private String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String savedName =  uuid.toString()+"_"+originalName;
	    return savedName;
	}
	
}
