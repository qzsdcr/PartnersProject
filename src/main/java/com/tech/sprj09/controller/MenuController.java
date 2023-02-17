package com.tech.sprj09.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.menu.MenuListService;
import com.tech.sprj09.service.menu.MenuWriteService;
import com.tech.sprj09.vopage.SearchVO;


@Controller
public class MenuController {
	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;
	
	// 목록표현

	@RequestMapping("/menu")

	public String list(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("========menulist 컨트롤러 지나감=======");
		// db에서 데이터 가져오기

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);
		
		
		
		bServiceInter = new MenuListService(sqlSession);
		bServiceInter.execute(model);

		return "menu/menulist";
	}

//	글쓰기폼기능
	@RequestMapping("/writeview")
	public String writeview(Model model) {
		System.out.println("========menuwriteview 컨트롤러 지나감=======");
		return "menu/writeview";
	}

//	글쓰기기능
	@RequestMapping("/menuwrite")
	public String write(HttpServletRequest request, Model model) throws Exception {
		System.out.println("========menuwrite 컨트롤러 지나감=======");
		
		model.addAttribute("request", request);
		bServiceInter = new MenuWriteService(sqlSession);
		bServiceInter.execute(model);
		
		
		
		return "redirect:menu/menulist";
	}
	
	

}