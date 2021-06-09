package com.pet.app.talktalk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class TalkHandler extends TextWebSocketHandler {
    
    
    private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String userId = searchUserName(session);
        sessionList.add(session);
            session.sendMessage(new TextMessage("recMs :"+MessageMapper.countMessageView(userId)));
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String userId= searchUserName(session);
 
        
//        WebSocketSession chatwritingSession =users.get("user_name");
//        if(chatwritingSession != null) {
//            TextMessage textMessage = new TextMessage(user_name+ " 님이 메세지를 보냈습니다.");
//            chatwritingSession.sendMessage(textMessage);
//        }
        for(WebSocketSession sess: sessionList) {
            sess.sendMessage(new TextMessage(userId+": "+message.getPayload()));
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String userId = searchUserName(session);
        System.out.println("연결 끊어짐");
        for(WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage(userId+"님의 연결이 끊어졌습니다."));
        }
        sessionList.remove(session);
    }
    
    public String searchUserName(WebSocketSession session)throws Exception {
        String userId;
        Map<String, Object> map;
        map = session.getAttributes();
        userId = (String) map.get("userId");
        return userId;
    }
}