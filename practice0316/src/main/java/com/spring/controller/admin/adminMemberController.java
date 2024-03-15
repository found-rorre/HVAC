package com.spring.controller.admin;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.memberDTO;
import com.spring.service.memberService;

@Controller
public class adminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminMemberController.class);
	
	@Autowired
	memberService service;
	
	@RequestMapping(value = "/admin/member.do", method = RequestMethod.GET)
	public String member(Model model, memberDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<memberDTO> list = service.memberList(dto);
		int totalCount = service.memberCount(dto);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/member";
	}
	
	@RequestMapping(value = "/admin/memberInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> memberInfo(Model model, memberDTO dto) {
	    memberDTO user = service.getMember(dto);
	    System.out.println(user);

	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String regDate = dateFormat.format(user.getRegdate());

	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("id", user.getId());
	    response.put("name", user.getName());
	    response.put("password", user.getPassword());
	    response.put("phone", user.getPhone());
	    response.put("email1", user.getEmail1());
	    response.put("email2", user.getEmail2());
	    response.put("jumin1", user.getJumin1());
	    response.put("jumin2", user.getJumin2());
	    response.put("postcode", user.getPostcode());
	    response.put("addr1", user.getAddr1());
	    response.put("addr2", user.getAddr2());
	    response.put("useYN", user.getUseYN());
	    response.put("regDate", regDate);

	    return response;
	}

	
	@RequestMapping(value = "/admin/memberUpdate.do", method = RequestMethod.PUT)
	@ResponseBody 
	public Map<String, String> memberUpdate(Model model, @RequestBody memberDTO dto) {
		service.updateMember(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "수정완료");
		
		return map;
	}
	
	@RequestMapping(value = "/admin/memberDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> memberDelete(Model model, @RequestBody String delIds) {
		String[] delData = delIds.split(",");
		service.deleteMember(delData);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
}
