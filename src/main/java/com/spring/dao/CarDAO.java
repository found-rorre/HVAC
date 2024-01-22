package com.spring.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.repleDTO;

@Mapper
public interface CarDAO {

	ArrayList<CarDTO> getlist();

	CarDTO selectByCarIdx(int car_idx);

	ArrayList<CarDTO> mainSearchCar(CarParam carParam);

	ArrayList<CarInfoDTO> getCarInfo();

	CarInfoDTO getSelectedCarinfo(int idx);

	void carinfoInsert(CarInfoDTO carInfoDTO);

	void carInsert(CarDTO carDTO);

	void carDelete(HashMap<String, Object> data);

	void carInfoDelete(int carInfo_idx);

	List<Map<String, Integer>> statusCount();

	List<String> getTypeList();

	List<String> getMakerList();

	void carUpdate(CarDTO carDTO);

	void adminCarUpdate(HashMap<String, Object> data);

	ArrayList<CarDTO> keywordSearch(String keyword);

	
}
