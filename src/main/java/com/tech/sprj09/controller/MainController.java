package com.tech.sprj09.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.ContentViewService;
import com.tech.sprj09.service.ListService;
import com.tech.sprj09.service.ReviewListService;
import com.tech.sprj09.vopage.SearchVO;

@Controller
public class MainController {
	
	BServiceInter bServiceInter;
	BServiceInter bServiceInter1;
	
	@Autowired
	private SqlSession sqlSession;
	
//	목록표현
	@RequestMapping("/list")
	public String list(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========list=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "list";
	}	
	@RequestMapping("/searchpage")
	public String searchpage(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========searchpage=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "searchpage";
	}
	
//	가산
	@RequestMapping("/gasan")
	public String gasan(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========gasan=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		
		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "gasan";
	}
	
	@RequestMapping("/gulo")
	public String gulo(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========gulo=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "gulo";
	}
	
	@RequestMapping("/yeouido")
	public String yeouido(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========yeouido=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "yeouido";
	}
	
	@RequestMapping("/gangnam")
	public String gangnam(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========gangnam=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "gangnam";
	}
	
	@RequestMapping("/pangyo")
	public String pangyo(HttpServletRequest request,SearchVO searchVO, Model model) {
		System.out.println("========pangyo=======");
		//db에서 데이터 가져오기
				
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);

		bServiceInter=new ListService(sqlSession);
		bServiceInter.execute(model);
		
		return "pangyo";
	}
	
//	상세페이지기능
	@RequestMapping("/contentview")
	public String contentview(HttpServletRequest request, Model model) {
		System.out.println("========contentview=======");
//		db에 디테일기능		
		//toss
		model.addAttribute("request",request);

		bServiceInter=new ContentViewService(sqlSession);
		bServiceInter.execute(model);
		
		bServiceInter1=new ReviewListService(sqlSession);
		bServiceInter1.execute(model);
				
		return "contentview";
	}

}
