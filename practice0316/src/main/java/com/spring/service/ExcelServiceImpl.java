package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.IExcelDao;
import com.spring.dto.memberDTO;

@Service
public class ExcelServiceImpl { 

	@Inject
	IExcelDao excelDao;
	
	public List<memberDTO> getmemberList(memberDTO dto) {
		return excelDao.getmemberList(dto);
	}


}