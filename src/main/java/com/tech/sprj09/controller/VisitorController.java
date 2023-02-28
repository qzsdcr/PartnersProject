package com.tech.sprj09.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.sprj09.service.GetVisitorIPService;
import com.tech.sprj09.service.VisitorServiceInter;

@Controller
public class VisitorController {

	VisitorServiceInter VisitorServiceInter;

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/VisitCount")
	@ResponseBody
	public Map<String, Integer> VisitCount(HttpServletRequest request, Locale locale, Model model) {
		
		
		// 방문자 IP받기 & 저장 (1)
		VisitorServiceInter = new GetVisitorIPService(sqlSession);
		VisitorServiceInter.execute(request, model);
		
		// 방문자수 count 하기
		GetVisitorIPService visitorService = new GetVisitorIPService(sqlSession);
		// 오늘 방문자수 count
		int todayVisitorCount = visitorService.getTodayVisitorCount();
		// 총 방문자수 count
		int totalVisitorCount = visitorService.getTotalVisitorCount();

		//결과값을 Map에 담아 반환
		Map<String, Integer> result = new HashMap<String, Integer>();
	    result.put("todayVisitorCount", todayVisitorCount);
	    result.put("totalVisitorCount", totalVisitorCount);
	    
	    return result;
	}
}
