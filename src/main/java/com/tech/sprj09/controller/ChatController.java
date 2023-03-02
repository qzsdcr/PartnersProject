package com.tech.sprj09.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.ChatService;

@Controller
public class ChatController {
	
	BServiceInter bServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/chat")
	public String chat(HttpServletRequest request,Model model) {
		System.out.println("========chat=======");
		
		String memid=request.getParameter("memid");
		System.out.println("memid : "+memid);
		
		model.addAttribute("request",request);
		
		bServiceInter=new ChatService(sqlSession);
		bServiceInter.execute(model);
		
		return "chat";
		
	}

}
