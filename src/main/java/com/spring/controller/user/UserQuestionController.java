package com.spring.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.common.paging;
import com.spring.dto.questionDTO;
import com.spring.service.questionService;

@Controller
public class UserQuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserQuestionController.class);
	
	@Autowired 
	questionService service;
	
	@RequestMapping(value = "/user/question.do", method = RequestMethod.GET)
	public String question(HttpServletRequest request, Model model, questionDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		logger.info("UserQuestionController의 question()");
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("memberID");
		dto.setUserid(userid);
		dto.setCurrentPage((currentPage-1) * 10);
		// logger.info("{} line36", userid);
		
		if(userid != null) {
			List<questionDTO> list = service.questionList(dto);
			logger.info("{} line40", list);
			int totalCount = service.questionCount(dto);
			logger.info("{} line42", totalCount);
			model.addAttribute("list", list);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		}
		return "user/question";
	}
	
	@RequestMapping(value = "/question/insert.do", method = RequestMethod.POST)
	public String questionInsert(HttpServletRequest request, HttpServletResponse response, Model model, questionDTO questionDTO) {
		logger.info("UserQuestionController의 questionInsert()");
		// logger.info("{} line54", questionDTO);
		
		service.questionInsert(questionDTO);
		
		return "redirect:/user/question.do";
	}
	
	@RequestMapping(value = "/question/delete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> questionDelete(HttpServletRequest request, HttpServletResponse response, Model model, @RequestBody String delIds) {
		logger.info("UserQuestionController의 questionDelete()");
		String[] delData = delIds.split(",");
		service.deleteQuestion(delData);
		System.out.println(delData);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		return map;
	}
}
