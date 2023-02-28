package com.tech.sprj09.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.CryptoService;
import com.tech.sprj09.vopage.SearchVO;

@Controller
public class UserController {

	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;

	// 마이페이지(UserController)로 이동
	@RequestMapping(value = "/userPage", method = RequestMethod.GET)
	public String userPage(HttpServletRequest request, SearchVO searchVO, Model model) {
		HttpSession session = request.getSession();
		String memid = (String) session.getAttribute("memid"); // 현재 로그인한 사용자의 아이디를 가져옴
		System.out.println("세션아이디 : " + memid);
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto member = dao.getMember(memid); // 사용자의 정보를 가져옴
		model.addAttribute("member", member);
		return "userPage";
	}

	// 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/userModifyForm", method = RequestMethod.GET)
	public String modifyForm(HttpServletRequest request, SearchVO searchVO, Model model) {
		HttpSession session = request.getSession();
		String memid = (String) session.getAttribute("memid"); // 현재 로그인한 사용자의 아이디를 가져옴
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto member = dao.getMember(memid); // 사용자의 정보를 가져옴
		model.addAttribute("member", member);
		return "userModifyForm";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request) {
		System.out.println(">>>>>>userModify<<<<<<<<<");
		HttpSession session = request.getSession();
		System.out.println(">>>userModify");

		// param값 저장
		String memid = (String) session.getAttribute("memid"); // 현재 로그인한 사용자의 아이디를 가져옴
		System.out.println("memid mod : " + memid);
		String mempass = request.getParameter("mempass"); // 비밀번호2
		String memname = request.getParameter("memname"); // 이름3
		String membirth = request.getParameter("membirth"); // 주민등록4
		String memsex = request.getParameter("memsex"); // 성별5
		String mememail = request.getParameter("mememail"); // 이메일6
		String mempnum = request.getParameter("mempnum"); // 핸드폰7
		mempnum = mempnum.replace("-", ""); // 핸드폰7에서 하이픈(-) 제거
		String memaddress = request.getParameter("memaddress"); // 선호지역8
		String memlikemenu = request.getParameter("memlikemenu"); // 선호메뉴9

		// 암호화 처리
		String shpwd = "";
		String bcpwd = "";
		try {
			shpwd = CryptoService.sha512(mempass); // 단방향
			bcpwd = CryptoService.encryptAES256(mempass, shpwd); // 양방향
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		IDao dao = sqlSession.getMapper(IDao.class);
		// 사용자의 정보를 수정함
		dao.modifyMember(memid, mempass, memname, membirth, memsex, mememail, mempnum, memaddress, memlikemenu, shpwd,
				bcpwd);
		System.out.println("----------insert SQL 전달-----------");
		session.setAttribute("msg", "회원 정보가 수정되었습니다."); // 메시지 설정
		return "redirect:userPage"; // 마이페이지(UserController)로 이동
	}

	// 회원 탈퇴 페이지로 이동
	@RequestMapping(value = "/userDeleteForm", method = RequestMethod.GET)
	public String userDeleteForm(HttpServletRequest request, SearchVO searchVO, Model model) {
		HttpSession session = request.getSession();
		String memid = (String) session.getAttribute("memid"); // 현재 로그인한 사용자의 아이디를 가져옴
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto member = dao.getMember(memid); // 사용자의 정보를 가져옴
		model.addAttribute("member", member);
		return "userDeleteForm";
	}

//	// 회원 탈퇴
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	public String delete(HttpServletRequest request, SearchVO searchVO, Model model) {
//		HttpSession session = request.getSession();
//		String memid = (String) session.getAttribute("memid"); // 현재 로그인한 사용자 아이디
//		IDao dao = sqlSession.getMapper(IDao.class);
//		dao.delete(memid);
//
//		session.invalidate();
//		return "redirect:/";
//	}
}
