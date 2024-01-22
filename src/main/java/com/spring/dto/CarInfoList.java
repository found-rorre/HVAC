package com.spring.dto;

import java.util.ArrayList;

public class CarInfoList {
	
ArrayList<CarInfoDTO> list = new ArrayList<CarInfoDTO>();

public ArrayList<CarInfoDTO> getList() {
	return list;
}

public void setList(ArrayList<CarInfoDTO> list) {
	this.list = list;
}

@Override
public String toString() {
	return "CarList [list=" + list + "]";
}


}
