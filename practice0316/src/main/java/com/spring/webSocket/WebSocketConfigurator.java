package com.spring.webSocket;

import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.servlet.http.HttpSession;

public class WebSocketConfigurator extends ServerEndpointConfig.Configurator {
	
	@Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        super.modifyHandshake(sec, request, response);
        
        // HttpSession을 가져와서 원하는 데이터를 세션에 저장
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        sec.getUserProperties().put("memberID", httpSession.getAttribute("memberID"));
    }
}
