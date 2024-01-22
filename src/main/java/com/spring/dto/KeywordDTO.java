package com.spring.dto;


public class KeywordDTO extends CarInfoDTO {
	
	private int keyword_idx;
	private String name;
	private String title;
	
	public int getKeyword_idx() {
		return keyword_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setKeyword_idx(int keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "KeywordDTO [keyword_idx=" + keyword_idx + ", name=" + name + ", title=" + title + "]";
	}

	
}
