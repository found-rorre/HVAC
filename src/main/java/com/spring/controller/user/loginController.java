package com.spring.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.memberDTO;
import com.spring.service.memberService;


@Controller
public class loginController {
	
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	
	@Autowired 
	memberService service;
	
	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "login/login";
	}

	@RequestMapping(value = "/login/register.do", method = RequestMethod.GET)
	public String register(Model model) {
	    // 여기서 필요한 로직을 수행하고 페이지를 반환
	    return "login/register";
	}
	
	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, memberDTO dto, String remember) throws IOException {
		if (remember == null) {
			response.addCookie(new Cookie("remember", "N"));
		} else {
			response.addCookie(new Cookie("remember", remember));
			response.addCookie(new Cookie("memberID", dto.getId()));
		}
		
		memberDTO member = service.getLogin(dto);
		
		if (member == null) {
			model.addAttribute("msg", "회원정보를 확인 할 수 없습니다.");
			return "login/login";
		} else {
			HttpSession session = request.getSession();

			session.setAttribute("memberID", member.getId());
			session.setAttribute("memberName", member.getName());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("memberID");
		session.removeAttribute("memberName");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login/registers.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> registers(@RequestParam String id) {
	    boolean isDuplicate = service.checkId(id);
	    String message = isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.";

	    Map<String, String> jsonResponse = new HashMap<String, String>();
	    jsonResponse.put("result", isDuplicate ? "duplicate" : "available");
	    jsonResponse.put("message", message);

	    return jsonResponse;
	}
	
	@RequestMapping(value = "/login/registers.do", method = RequestMethod.POST)
	public String registers(Model model, memberDTO dto) {
		
		service.insertMember(dto);
		model.addAttribute("id", dto.getId());
		return "login/complete";
	}
	
	
	
}