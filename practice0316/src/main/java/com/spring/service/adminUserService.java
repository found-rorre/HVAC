package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.adminUserDAO;
import com.spring.dto.adminUserDTO;


@Service
public class adminUserService {
	
	@Autowired
	adminUserDAO dao;

	public adminUserDTO getUser(adminUserDTO dto) {
		adminUserDTO user = dao.getUser(dto);
		
		return user;
	}
	
	
}
