package com.spring.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.repleDTO;

@Mapper
public interface repleDAO {
	
	void repleInsert(repleDTO reple);

	repleDTO repleExist(repleDTO reple);

	void repleUpdate(repleDTO reple);

	repleDTO repleSelect(int idx);
	
}
