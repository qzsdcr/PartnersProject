package com.tech.sprj09.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.sprj09.service.BServiceInter;

@Controller
public class UserController {
	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;

//	userPage로
	@RequestMapping("/userPage")
	public String userPage(HttpServletRequest request, Model model) {
	    String loginId = request.getParameter("loginId");
	    String loginCheck = request.getParameter("loginCheck");
	    
	    System.out.println(loginId);
	    System.out.println(loginCheck);
	    model.addAttribute("loginId", loginId);
	    model.addAttribute("loginCheck", loginCheck);
	    return "userPage";
	}


}