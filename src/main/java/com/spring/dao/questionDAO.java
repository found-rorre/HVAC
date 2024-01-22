package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.questionDTO;

@Mapper
public interface questionDAO {
	
	public void questionInsert(questionDTO questionDTO);

	public List<questionDTO> questionList(questionDTO dto);

	public int questionCount(questionDTO dto);

	public void questionDelete(String[] delData);

	public List<questionDTO> adminQuestionList(questionDTO dto);

	public int adminQuestionCount(questionDTO dto);

	public void questionUpdate(questionDTO dto);
	
	public void deleteQuestion(String[] delData);

	public questionDTO questionSelect(questionDTO dto);

	public int unfinishedCount();
	
}
