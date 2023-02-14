package com.tech.sprj09.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.admin.MemberDeleteService;
import com.tech.sprj09.service.admin.MemberListService;
import com.tech.sprj09.service.admin.MemberModifyService;
import com.tech.sprj09.service.admin.MemberViewService;
import com.tech.sprj09.service.sikdang.SListService;
import com.tech.sprj09.service.sikdang.SikDeDeleteService;
import com.tech.sprj09.service.sikdang.SikDeModifyService;
import com.tech.sprj09.service.sikdang.SikDeViewService;
import com.tech.sprj09.vopage.admin.AdminSearchVO;



@Controller
public class AdminController {
	BServiceInter bServiceInter;
	BServiceInter bServiceInter1;

	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping("/admin")
	public String admin(HttpServletRequest request, AdminSearchVO adminsearchVO, Model model) {
		System.out.println("========admin=======");
		// db에서 데이터 가져오기
		
		model.addAttribute("request", request);
		model.addAttribute("adminsearchVO", adminsearchVO);

		bServiceInter = new MemberListService(sqlSession);	
		bServiceInter.execute(model);

		bServiceInter1 = new SListService(sqlSession);	
		bServiceInter1.execute(model);

		return "admin/admin";

	}
//////////////////////////////////////////////////////////////////////////////23-02-03	
//	상세페이지기능
	@RequestMapping("/memberview")
	public String memberview(HttpServletRequest request, Model model) {
		System.out.println("========memberview=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);

		bServiceInter = new MemberViewService(sqlSession);
		bServiceInter.execute(model);

		return "admin/memberview";
	}
	
//	글수정하기
	@RequestMapping(method = RequestMethod.POST, value = "/membermodify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("========membermodify=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new MemberModifyService(sqlSession);
		bServiceInter.execute(model);
//	
		return "redirect:admin";
	}

//	글삭제하기
	@RequestMapping("/memberdelete")
	public String memberdelete(HttpServletRequest request, Model model) {
		System.out.println("========memberdelete=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new MemberDeleteService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:admin";
	}
//////////////////////////////////////////////////////////////////////////
	// 식당 글 수정 및 삭제
	
//	상세페이지기능
	@RequestMapping("/sikdeview")
	public String SikDeview(HttpServletRequest request, Model model) {
		System.out.println("========SikDeview=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);

		bServiceInter = new SikDeViewService(sqlSession);
		bServiceInter.execute(model);

		return "admin/sikdeview";
	}
	
//	글수정하기
	@RequestMapping(method = RequestMethod.POST, value = "/sikdemodify")
	public String SikDemodify(HttpServletRequest request, Model model) {
		System.out.println("========SikDemodify=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new SikDeModifyService(sqlSession);
		bServiceInter.execute(model);
//	
		return "redirect:admin";
	}
//	글삭제하기
	@RequestMapping("/sikdedelete")
	public String sikdedelete(HttpServletRequest request, Model model) {
		System.out.println("========memberdelete=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new SikDeDeleteService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:admin";
	}

}