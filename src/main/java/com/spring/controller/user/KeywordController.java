package com.spring.controller.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.spring.service.KeywordService;
import com.spring.service.RentalService;

@Controller
public class KeywordController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	@Autowired 
	KeywordService service;
	
	@Autowired
	CarList carList;
	
	@Autowired
	CarDTO carDTO;

	

	
	
}