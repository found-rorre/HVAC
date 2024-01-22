package com.spring.dto;

import java.sql.Date;

public class repleDTO {
	
	private int reidx;
	private int idx;
	private String answer;
	private String adminid;
	private String adminname;
	private String reple;
	private Date regdate;
	private Date updatedate;
	
	public int getReidx() {
		return reidx;
	}
	public void setReidx(int reidx) {
		this.reidx = reidx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getReple() {
		return reple;
	}
	public void setReple(String reple) {
		this.reple = reple;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "repleDTO [reidx=" + reidx + ", idx=" + idx + ", answer=" + answer + ", adminid=" + adminid
				+ ", adminname=" + adminname + ", reple=" + reple + ", regdate=" + regdate + ", updatedate="
				+ updatedate + "]";
	}
}
