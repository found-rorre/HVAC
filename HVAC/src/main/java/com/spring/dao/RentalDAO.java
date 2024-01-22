package com.spring.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.repleDTO;

@Mapper
public interface RentalDAO {

	ArrayList<RentalDTO> getRentalList();

	void rentalInsert(Map<String, Object> data);

	Integer income(Map<String, Object> data);

	List<Map<String, Integer>> incomeList();

	ArrayList<RentalDTO> rentListMonth(Map<String, Object> data);

	
}
