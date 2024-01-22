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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.x.protobuf.MysqlxExpect.Open.Condition.Key;
import com.spring.common.paging;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarInfoList;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.KeywordDTO;
import com.spring.dto.questionDTO;
import com.spring.dto.userDTO;
import com.spring.service.CarService;
import com.spring.service.KeywordService;
import com.spring.service.RentalService;
import com.spring.service.adminUserService;

@Controller
public class adminKeywordController {

	private static final Logger logger = LoggerFactory.getLogger(adminKeywordController.class);

	@Autowired
	KeywordService service;
	@Autowired
	CarList carList;
	@Autowired
	CarInfoList infoList;	
	
	
	@RequestMapping(value = "/admin/keyword", method = RequestMethod.GET)
	public String adminKeyword(Model model) {
		
		ArrayList<KeywordDTO> keywordList = service.getkeywordList();
		
		model.addAttribute("keywordList", keywordList);
		return "admin/keyword";
	}
	
	@RequestMapping(value = "/adminkeyword/keywordOpstion", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> userInsert() {
		List<String> keywordList = service.keywordOpstion();
		
		System.out.println(keywordList);
		Map<String, String> map = new HashMap<String, String>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String keywordListString = objectMapper.writeValueAsString(keywordList);
			map.put("result", "success");
			map.put("keywordList", keywordListString);
		} catch (Exception e) { }
		
		return map;
	}
	@RequestMapping(value = "/adminkeyword/keywordInsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> keywordInsert(@RequestBody Map<String, Object> data) {
		System.out.println(data);
		service.keywordInsert(data);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("result", "success");
		
		return map;
	}
	
//	키워드 삭제
	@RequestMapping(value = "/admin/keywordDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> keywordDelete(@RequestBody HashMap<String, Object> data) {
		System.out.println("adminKeyword의 keywordDelete");
		
		service.keywordDelete(data);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
//	키워드 수정
	@RequestMapping(value = "/admin/keywordUpdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> keywordUpdate(@RequestBody HashMap<String, String> data) {
		System.out.println("adminKeyword의 keywordUpdate");
		System.out.println(data);
		service.keywordUpdate(data);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
	
//	키워드 생성
	@RequestMapping(value = "/admin/keywordInsert", method = RequestMethod.POST)
	public String keywordInsert(KeywordDTO keywordDTO) {
			System.out.println(keywordDTO);
			
			service.keywordInsert(keywordDTO);
			
			return "";
		}
	
}














