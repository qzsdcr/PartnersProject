package com.tech.sprj09.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.WebSocketSession;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MemberDto;

@Service
@ServerEndpoint("/chat")
public class ChatService implements BServiceInter{
	
	private static Map<Session,MemberDto> users = Collections.synchronizedMap(new HashMap<Session, MemberDto>());
	
	private SqlSession sqlSession;
	
	public ChatService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public ChatService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ChatService");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String memid=request.getParameter("memid");
		System.out.println("memid : "+memid);
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		ArrayList<MemberDto> mdto=dao.chat();
		
		model.addAttribute("chat",mdto);
		
	}
		
		
	@OnMessage
	public void onMsg(String message, Session session) throws IOException{
		String userName = users.get(session).getMemid();
		System.out.println(userName + " : " + message);
		
		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				if(!currentSession.equals(session)){
					currentSession.getBasicRemote().sendText(userName + " : " + message);
				}
			}
		}
		
	}
	
	@OnOpen
	public void onOpen(Session session) {
		
		String userName = "user";
		
		int rand_num = (int)(Math.random()*1000);
		
		
		MemberDto client = new MemberDto();
		System.out.println("session : "+session);
		client.setMemid(userName+rand_num);
		
		System.out.println(session + " connect");
		
		users.put(session, client);
		sendNotice(client.getMemid() + "님이 입장하셨습니다. 현재 사용자 " + users.size() + "명");
	}
	
	
	public void sendNotice(String message){
		String userName = "server";
		System.out.println(userName + " : " + message);
		
		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				try {
					currentSession.getBasicRemote().sendText(userName + " : " + message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		String userName = users.get(session).getMemid();
		users.remove(session);
		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + users.size() + "명");
	}		

}
