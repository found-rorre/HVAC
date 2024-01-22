package com.spring.controller.admin;

import java.io.IOException;

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

import com.spring.dto.adminUserDTO;
import com.spring.service.adminUserService;

@Controller
public class adminLoginController {

	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);

	@Autowired
	adminUserService service;

	private String path;

	@RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
	public String login(Model model, String path) {
		this.path = path;

		return "admin/login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, String path) {

		return "admin/login";
	}

	@RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, adminUserDTO dto)
			throws IOException {

		adminUserDTO user = service.getUser(dto);

		if (user == null) {
			model.addAttribute("msg", "사번정보를 확인 할 수 없습니다.");
			return "admin/login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("ID", user.getId());
			session.setAttribute("Name", user.getName());

		}

		return "redirect:" + (this.path == null || this.path.equals("/admin") ? "/admin/main.do" : this.path);
	}

	@RequestMapping(value = "/admin/logout.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("ID");
		session.removeAttribute("Name");

		return "redirect:/admin/login.do";
	}

	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String mainPage(Model model) {
		return "admin/main"; // "admin/main"은 뷰의 이름입니다.
	}
}
