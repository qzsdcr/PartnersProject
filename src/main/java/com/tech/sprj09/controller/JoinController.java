package com.tech.sprj09.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.JoinService;
import com.tech.sprj09.service.MailService;
import com.tech.sprj09.service.TempKey;
import com.tech.sprj09.service.passChangeService;
import com.tech.sprj09.vopage.SearchVO;

@Controller
public class JoinController {
	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;
	private MailService mailService;
	
	@Autowired
	public JoinController(MailService mailService) {
		this.mailService = mailService;
	}

	// 회원타입
	@RequestMapping("/jointype")
	public String jointype(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============this is jointype============");
		return "jointype";
	}

	// 일반회원가입폼으로
	@RequestMapping("/joinform1")
	public String joinform1(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============this is joinform============");
		return "joinform1";
	}

	// 식당회원가입폼으로
	@RequestMapping("/joinform2")
	public String joinform2(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============this is joinform============");
		return "joinform2";
	}

	// 회원가입 기능
	@RequestMapping("/join")
	public String joinProc(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============join PROC============");

		model.addAttribute("request", request);

		bServiceInter = new JoinService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:login";
	}

	// id중복조회
	@ResponseBody
	@RequestMapping(value = "/usingId_chk", produces = "text/plain")
	public String idCheck(HttpServletRequest request, HttpServletResponse reponse, Model model) {
		System.out.println("=======usingId_chk==========");

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String memid = request.getParameter("memid");
		System.out.println("memid컨트롤 : " + memid);

		IDao dao = sqlSession.getMapper(IDao.class);
		int using_id = dao.idLookup(memid); // 아이디 존재 여부 확인
		System.out.println("using_user" + using_id);
		String result = "" + using_id; // 숫자를 문자열로 변환

		return result;
	}
	
	// 이메일 인증
	// 인증번호 생성
	@ResponseBody
	@RequestMapping("/tempkey")
	public String getTempKey(HttpServletRequest request) {
		System.out.println("=======이메일인증tempkey==========");

		try {
	    String tempkey = TempKey.generateTempKey();
	    String toAddress = request.getParameter("email"); // 사용자 이메일주소
	    String subject = "Partners 회원가입 인증을 위한 메일입니다";
	    String fromAddress = "kowouk@gmail.com";
	    String body = "인증 번호 : " + tempkey;

	    mailService.sendEmail(toAddress, subject, body, fromAddress);
	    
	    return tempkey;
	  } catch (Exception e) {
	    e.printStackTrace();
	    return null;
	  }
	}    

}