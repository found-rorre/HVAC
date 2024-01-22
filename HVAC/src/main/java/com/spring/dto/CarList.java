package com.spring.dto;

import java.util.ArrayList;

public class CarList {
	
ArrayList<CarDTO> list = new ArrayList<CarDTO>();

public ArrayList<CarDTO> getList() {
	return list;
}

public void setList(ArrayList<CarDTO> list) {
	this.list = list;
}

@Override
public String toString() {
	return "CarList [list=" + list + "]";
}


}
