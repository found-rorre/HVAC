package com.spring.dto;

import java.util.ArrayList;

public class chatList {
	
	ArrayList<chatDTO> list = new ArrayList<chatDTO>();

	public ArrayList<chatDTO> getList() {
		return list;
	}

	public void setList(ArrayList<chatDTO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "chatList [list=" + list + "]";
	}
}
