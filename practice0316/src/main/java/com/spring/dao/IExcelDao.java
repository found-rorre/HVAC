package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.memberDTO;


@Mapper
public interface IExcelDao {
	
	public List<memberDTO> getmemberList(memberDTO dto);
}