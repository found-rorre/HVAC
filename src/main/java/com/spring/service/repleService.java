package com.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dao.repleDAO;
import com.spring.dto.repleDTO;

@Service
public class repleService {
	
	private static final Logger logger = LoggerFactory.getLogger(repleService.class);
	
	@Autowired
	repleDAO dao;
	
	public void repleInsert(repleDTO reple) {
		
		repleDTO re = dao.repleExist(reple);
		// reple 존재 유무에 따라 inert와 update를 한다.
		if(re == null) {
			dao.repleInsert(reple);
		}else{
			dao.repleUpdate(reple);
		}
		
	}

	public Map<String, String> repleSelect(String idx) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		// ObjectMapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();

		try {
		    // JSON 문자열 파싱
		    Map<String, String> jsonMap = objectMapper.readValue(idx, new TypeReference<Map<String, String>>() {});

		    // "delIds" 키에 해당하는 값을 추출
		    int intIdx = Integer.parseInt(jsonMap.get("idx"));
		    repleDTO reple = dao.repleSelect(intIdx);
		    logger.info("44{}",reple);
		    
			map.put("result", "success");
			map.put("message", "삭제완료");
			map.put("data", reple.getReple());
			return map;
		} catch (Exception e) { }
		
		
		map.put("result", "error");
		map.put("message", "삭제실패");
		
		return map;
		
	}

	
}
