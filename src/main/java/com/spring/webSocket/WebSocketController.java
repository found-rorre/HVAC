package com.spring.webSocket;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.dto.chatDTO;
import com.spring.dto.chatList;
import com.spring.service.chatService;

@Controller
public class WebSocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Autowired
	chatService service;
	
	// 채팅방 메시지 목록 불러오기
	@RequestMapping(value = "/webSocket/messageList.do", method = RequestMethod.GET)
	public void messageList(HttpServletResponse response, chatDTO dto) throws JsonIOException, IOException {
		logger.info("UserWebsocketController의 messageList()");
		Gson gson = new GsonBuilder().create();
		
		// chatList 가져오기		
		List<chatDTO> list = service.chatList(dto);
		
		response.setContentType("applicaion/json; charset=UTF-8");
		// json 문자열로 변환
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping(value = "/webSocket/insertChat.do", method = RequestMethod.GET)
	@ResponseBody
	public void insertChat(HttpServletResponse response, @RequestParam String id, @RequestParam String message, @RequestParam String room_id) throws JsonIOException, IOException {
		logger.info("UserWebsocketController의 insertChat()");
		logger.info(id);
		logger.info(message);
		logger.info(room_id);
		
		chatDTO chat = new chatDTO();
		chat.setId(id);
		chat.setMessage(message);
		chat.setRoom_id(room_id);
		service.insertChat(chat);
		
		Gson gson = new GsonBuilder().create();
		response.setContentType("applicaion/json; charset=UTF-8");
		// json 문자열로 변환
		gson.toJson("성공", response.getWriter());
	}
	
	@RequestMapping(value = "/admin/adminChat.do", method = RequestMethod.GET)
	public String adminChat(HttpServletRequest request) {
		logger.info("UserWebsocketController의 adminChat()");
		
		return "admin/adminChat";
	}
	
}
