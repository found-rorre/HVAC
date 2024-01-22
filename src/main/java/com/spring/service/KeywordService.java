package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CarDAO;
import com.spring.dao.KeywordDAO;
import com.spring.dao.memberDAO;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.KeywordDTO;
import com.spring.dto.memberDTO;

@Service
public class KeywordService {
	
	@Autowired
	KeywordDAO dao;

	public List<String> keywordOpstion() {
		return dao.keywordOpstion();
		
	}

	public void keywordInsert(Map<String, Object> data) {
		dao.carkeywordInsert(data);
	}

	public Map<String, ArrayList<CarInfoDTO>> getkeywordCarList() {
		
		List<String> keywordNames = dao.keywordOpstion();
		
		Map<String, ArrayList<CarInfoDTO>> keywordList = new HashMap<String, ArrayList<CarInfoDTO>>();
		
		for (String item : keywordNames) {
			keywordList.put(item, dao.getkeywordCarList(item));
			
			if(keywordList.get(item).size() <= 0) {
				keywordList.remove(item);
			}
		}
		
		return keywordList;
	}

	public ArrayList<KeywordDTO> getkeywordList() {
		return dao.getkeywordList();
	}

	public void keywordDelete(HashMap<String, Object> data) {
		dao.keywordDelete(data);
		
	}

	public void keywordInsert(KeywordDTO keywordDTO) {
		dao.keywordInsert(keywordDTO);
		
	}

	public void keywordUpdate(HashMap<String, String> data) {
		dao.keywordUpdate(data);
	}


	

}
