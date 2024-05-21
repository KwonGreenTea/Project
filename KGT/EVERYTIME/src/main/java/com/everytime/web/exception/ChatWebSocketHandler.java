package com.everytime.web.exception;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {

    private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
    
    /*
     * 클라이언트가 접속하면, 클라이언트가 전달한 WebSocketSession을 users 맵에 추가한다.
     * 이 users 맵을 채팅 메시지를 전달할 모든 클라이언트에게 사용한다.
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println(session.getId() + " 연결됨");
        users.put(session.getId(), session);
    }
    
    /*
     * 클라이언트가 보낸 메시지는 users 맵에 저장된 모든 WebSocketSession에게 다시 전달된다.
     * 클라이언트가 메시지를 보내면 채팅 서버가 이를 받아서 모든 클라이언트에게 다시 보낸다.
     * 특정 클라이언트가 채팅 메시지를 보내면 연결된 모든 클라이언트가 그 메시지를 받고 화면에 표시한다.
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
        for (WebSocketSession s : users.values()) {
            s.sendMessage(message);
            System.out.println(s.getId() + "에게 메시지 전달 : " + message.getPayload());
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println(session.getId() + " 전송 에러 발생 : " + exception.getMessage());
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println(session.getId() + " 연결 종료됨");
        users.remove(session.getId());
    }
}
