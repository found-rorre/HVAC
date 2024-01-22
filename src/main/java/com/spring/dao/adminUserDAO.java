package com.spring.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.adminUserDTO;

@Mapper
public interface adminUserDAO {

	public adminUserDTO getUser(adminUserDTO dto);

}
