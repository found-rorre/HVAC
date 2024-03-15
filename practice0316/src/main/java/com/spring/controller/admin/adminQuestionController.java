package com.spring.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.questionDTO;
import com.spring.dto.repleDTO;
import com.spring.service.questionService;
import com.spring.service.repleService;

@Controller
public class adminQuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminQuestionController.class);
	
	@Autowired 
	questionService service;
	
	@Autowired
	repleService repleService;
	
	@RequestMapping(value = "/admin/question.do", method = RequestMethod.GET)
	public String adminQuestion(Model model,questionDTO dto,@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		logger.info("adminQuestionController의 question()");
		dto.setCurrentPage((currentPage-1) * 10);
		logger.info("{} line30", dto);
		
		List<questionDTO> list = service.adminQuestionList(dto);
		logger.info("{} line32", list);
		int totalCount = service.adminQuestionCount(dto);
		logger.info("{} line34", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/question";
	}
	
	@RequestMapping(value = "/adminQuestion/reple.do", method = RequestMethod.POST)
	public String adminQuestionReple(HttpServletResponse response, HttpServletRequest request, Model model,questionDTO dto, repleDTO reple) {
		logger.info("adminQuestionController의 adminQuestionReple()");
		logger.info("line58 {}", dto);
		logger.info("line59 {}", reple);
		
		service.questionUpdate(dto);
		questionDTO item = service.questionSelect(dto);
		logger.info("line63 {}", item);
		repleService.repleInsert(reple);
		
		// 메일 보내기
		service.questionEmail(item, reple);
		
		return "redirect:/admin/question.do";
	}
	
	@RequestMapping(value = "/admin/deleteQuest.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> deleteQuest(Model model, @RequestBody String delIds) {
		logger.info("adminQuestionController의 deleteQuest()");
		String[] delData = delIds.split(",");
		service.deleteQuestion(delData);
		System.out.println(delData);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		return map;
	}
	
	@RequestMapping(value = "/adminQuestion/repleSelect.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> repleSelect(HttpServletResponse response, HttpServletRequest request, Model model, repleDTO reple, @RequestBody String idx) {
		logger.info("adminQuestionController의 repleSelect()");
        logger.info("line87 {}", idx);
        
        Map<String, String> map = new HashMap();
        map = repleService.repleSelect(idx);
        
		return map;
	}
	
//	처리되지않은 요청의 갯수(Main)
	@RequestMapping(value = "/adminQuestion/unfinishedCount", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> repleSelect() {
		logger.info("adminQuestionController의 unfinishedCount()");
		
		
		int unfinishedCount = service.unfinishedCount();
		
		System.out.println(unfinishedCount);

		Map<String, String> map = new HashMap<String, String>();
        map.put("result", "success");
        map.put("unfinishedCount", Integer.toString(unfinishedCount));
        
		return map;
	}
	
}
