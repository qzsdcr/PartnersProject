package com.tech.sprj09.chat.server;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.tech.sprj09.chat.vo.ChatClient;
import com.tech.sprj09.dto.MemberDto;

//@ServerEndpoint("/chat")
//public class WebChatServer extends HttpServlet{
//	
////	private static Map<Session,ChatClient> users = Collections.synchronizedMap(new HashMap<Session, ChatClient>());
//	private static Map<Session,MemberDto> users = Collections.synchronizedMap(new HashMap<Session, MemberDto>());
//	
//	
//	
//	@OnMessage
//	public void onMsg(String message, Session session) throws IOException{
//		String userName = users.get(session).getMemid();
//		System.out.println(userName + " : " + message);
//		
//		synchronized (users) {
//			Iterator<Session> it = users.keySet().iterator();
//			while(it.hasNext()){
//				Session currentSession = it.next();
//				if(!currentSession.equals(session)){
//					currentSession.getBasicRemote().sendText(userName + " : " + message);
//				}
//			}
//		}
//		
//	}
//	
//	@OnOpen
//	public void onOpen(Session session, EndpointConfig endpointConfig) {
//		String memid="memid";
////		int rand_num = (int)(Math.random()*1000);
//		
//		
////		ChatClient client = new ChatClient();
//		MemberDto client = new MemberDto();
//		System.out.println(session);
////		client.setMemid(userName+rand_num);
//		client.setMemid(memid);
//		
//		System.out.println(session + " connect");
//		
//		users.put(session, client);
//		sendNotice(client.getMemid() + "님이 입장하셨습니다. 현재 사용자 " + users.size() + "명");
//	}
//	
//	
//	public void sendNotice(String message){
//		String userName = "server";
//		System.out.println(userName + " : " + message);
//		
//		synchronized (users) {
//			Iterator<Session> it = users.keySet().iterator();
//			while(it.hasNext()){
//				Session currentSession = it.next();
//				try {
//					currentSession.getBasicRemote().sendText(userName + " : " + message);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//
//	@OnClose
//	public void onClose(Session session) {
//		String userName = users.get(session).getMemid();
//		users.remove(session);
//		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + users.size() + "명");
//	}
//
//}
