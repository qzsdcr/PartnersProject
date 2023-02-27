package com.tech.sprj09.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.menu.MenuCalendarDetailService;
import com.tech.sprj09.service.menu.MenuContentUpdateService;
import com.tech.sprj09.service.menu.MenuContentviewService;
import com.tech.sprj09.service.menu.MenuDeleteService;
import com.tech.sprj09.service.menu.MenuListService;
import com.tech.sprj09.service.menu.MenuModifyService;
import com.tech.sprj09.service.menu.MenuWriteService;
import com.tech.sprj09.service.menu.SikdangListService;
import com.tech.sprj09.vopage.SearchVO;

@Controller
public class MenuController {
	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;

	// 목록표현

	@RequestMapping("/menulist")

	public String list(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("========menulist 컨트롤러 지나감=======");
		// db에서 데이터 가져오기

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		bServiceInter = new MenuListService(sqlSession);
		bServiceInter.execute(model);

		return "menu/menulist";
	}

//	상세페이지기능
	@RequestMapping("/menucontentview")
	public String menucontentview(HttpServletRequest request, Model model) {
		System.out.println("========menucontentview 컨트롤러 지나감=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);

		bServiceInter = new MenuContentviewService(sqlSession);
		bServiceInter.execute(model);

		return "menu/menucontentview";
	}

	// 메뉴컨텐트업데이트 폼으로
	@RequestMapping("/menucontentupdate")
	public String menucontentupdate(HttpServletRequest request, Model model) {
		System.out.println("========menucontentupdate 컨트롤러 지나감=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);

		bServiceInter = new MenuContentUpdateService(sqlSession);
		bServiceInter.execute(model);

		return "menu/menucontentupdate";
	}

//	글수정하기
	@RequestMapping(method = RequestMethod.POST, value = "/menumodify")
	public String menumodify(HttpServletRequest request, Model model) {
		System.out.println("========menumodify=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new MenuModifyService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:list";
	}

//	글쓰기폼기능
	@RequestMapping("/menuwriteview")
	public String writeview(Model model) {
		System.out.println("========menuwriteview 컨트롤러 지나감=======");
		
		bServiceInter = new SikdangListService(sqlSession);
		bServiceInter.execute(model);
		
		return "menu/menuwriteview";
	}

//	글쓰기기능
	@RequestMapping("/menuwrite")
	public String write(HttpServletRequest request, Model model) throws Exception {
		System.out.println("========menuwrite 컨트롤러 지나감=======");

		model.addAttribute("request", request);
		System.out.println(request);
		bServiceInter = new MenuWriteService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:menulist";
	}

//	글삭제하기
	@RequestMapping("/menudelete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("========delete=======");
//		db에 디테일기능		
		// toss
		model.addAttribute("request", request);
		bServiceInter = new MenuDeleteService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:menulist";
	}

	// 캘린더뷰
	@RequestMapping("/calendar")
	public String calendar(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("========calendar 컨트롤러 지나감=======");
		// db에서 데이터 가져오기

		String year = request.getParameter("year");
		String month = request.getParameter("month");

		// year와 month 값이 null이면 현재 년월을 사용함
		if (year == null || month == null) {
			Calendar now = Calendar.getInstance();
			year = Integer.toString(now.get(Calendar.YEAR));
			month = Integer.toString(now.get(Calendar.MONTH) + 1);
		}

		// 뷰에 전달할 year와 month 값을 모델에 추가
		model.addAttribute("year", year);
		model.addAttribute("month", month);

		return "menu/calendar";
	}

	@RequestMapping("/calendardetail")
	public String calendardetail(HttpServletRequest request,@RequestParam String sikno, @RequestParam String menudate, Model model) {
		System.out.println("========calendardetail 컨트롤러 지나감=======");
		// db에서 데이터 가져오기
		model.addAttribute("sikno", sikno);
		model.addAttribute("menudate", menudate);
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");

		// year와 month 값이 null이면 현재 년월을 사용함
		if (year == null || month == null) {
			Calendar now = Calendar.getInstance();
			year = Integer.toString(now.get(Calendar.YEAR));
			month = Integer.toString(now.get(Calendar.MONTH) + 1);
		}

		// 뷰에 전달할 year와 month 값을 모델에 추가
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		bServiceInter = new MenuCalendarDetailService(sqlSession);
		bServiceInter.execute(model);
		
		return "menu/calendar";
	}

}