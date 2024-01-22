package com.spring.dto;

import java.sql.Date;

public class chatDTO {
	
	private int idx;
	private String id;
	private String message;
	private Date message_regdate;
	private String room_id;
	/*
	private int unread_member_counts;
	private int unread_admin_counts;
	*/
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessage_regdate() {
		return message_regdate;
	}
	public void setMessage_regdate(Date message_regdate) {
		this.message_regdate = message_regdate;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	
	@Override
	public String toString() {
		return "chatDTO [idx=" + idx + ", id=" + id + ", message=" + message + ", message_regdate=" + message_regdate
				+ ", room_id=" + room_id + "]";
	}
}
