package com.tech.sprj09.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.vopage.SearchVO;

@Controller
public class LoginController {

	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;

//	로그인 jsp로 가는 기능
	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}

	// 로그인 유효성 검사 (login check service 기능)
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============loginCheck============");

		String memid = request.getParameter("memid");
		String mempass = request.getParameter("mempass");
		
		MemberDto dto = new MemberDto();
		dto.setMemid(memid);
		dto.setMempass(mempass);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto findMember = dao.login(memid, mempass);

		// LoginService에서 member를 조회하고 존재하면 list로 이동 존재하지 않으면 login 이동 후 메세지 띄움
		if (findMember != null) {
			return "list";
		}else {
			model.addAttribute("message","로그인 실패입니다.");
			return "login";
		}
	}
}
