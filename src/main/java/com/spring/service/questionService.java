package com.spring.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dao.questionDAO;
import com.spring.dao.userDAO;
import com.spring.dto.memberDTO;
import com.spring.dto.questionDTO;
import com.spring.dto.repleDTO;
import com.spring.dto.userDTO;

@Service
public class questionService {
	
	private static final Logger logger = LoggerFactory.getLogger(questionService.class);
	
	@Autowired
	questionDAO dao;
	
	@Autowired
	userDAO userdao;
	
	public void questionInsert(questionDTO questionDTO) {
		dao.questionInsert(questionDTO);
	}

	public List<questionDTO> questionList(questionDTO dto) {
		List<questionDTO> questionList = dao.questionList(dto);
		return questionList;
	}

	public int questionCount(questionDTO dto) {
		
		int questionCount = dao.questionCount(dto);
		
		return questionCount;
	}

	public List<questionDTO> adminQuestionList(questionDTO dto) {
		List<questionDTO> list = dao.adminQuestionList(dto);
		return list;
	}

	public int adminQuestionCount(questionDTO dto) {
		logger.info("{} service-line84", dto);
		int count = dao.adminQuestionCount(dto);
		return count;
	}

	public void questionUpdate(questionDTO dto) {
		logger.info("service-line90 {}", dto);
		dao.questionUpdate(dto);
	}
	
	
	public void deleteQuestion(String[] delData) {
		dao.deleteQuestion(delData);
	}

	public questionDTO questionSelect(questionDTO dto) {
		return dao.questionSelect(dto);
	}

	public void questionEmail(questionDTO item, repleDTO reple) {
		// 답변자 정보 가져오기
		userDTO dto = userdao.userInfo(reple.getAdminid());
		logger.info("service-line114 {}", dto);
		
		// 메일 보내기
		String from = "ajrwkd1@naver.com";
		String to = item.getEmail();
		String subject = "문의하신 글에 답변이 달렸습니다.";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String regdatea = sdf.format(item.getRegdate());
		String content = regdatea+"에 " + item.getUserid() + "님 신청하신 " + item.getTitle() + " 문의에 대해 " +item.getAnswer()+"(으)로 상태가 변경되었습니다.\r\n확인 부탁드립니다.\r\n"+
		"\r\n\r\n(주)더조은 렌터카\r\n                                 "+dto.getPosition() + "\r\n" + dto.getName() + "\r\n이메일: " + dto.getEmail()+ "\r\n전화번호: " + dto.getPhone();
		
		// 폼값(이메일 내용) 저장
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", from); // 보내는 사람
		emailInfo.put("to", to); // 받는 사람
		emailInfo.put("subject", subject); // 제목
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		logger.info("line122 {}", emailInfo);
		try {
			com.spring.api.NaverSMTP smtpServer = new com.spring.api.NaverSMTP(); // 메일 전송 클래스 생성
			smtpServer.emailSending(emailInfo); // 전송
			logger.info("이메일 전송 성공");
		} catch (Exception e) {
			logger.info("이메일 전송 실패");
			e.printStackTrace();
		}
		
	}
	
	public int unfinishedCount() {
		logger.info("questionService");

		return dao.unfinishedCount();
	}
}
