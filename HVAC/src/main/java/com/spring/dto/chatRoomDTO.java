package com.spring.dto;

public class chatRoomDTO {
	
	private int idx;
	private String id;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "chatRoomDTO [idx=" + idx + ", id=" + id + "]";
	}
}
