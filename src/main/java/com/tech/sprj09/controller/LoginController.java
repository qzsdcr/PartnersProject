package com.tech.sprj09.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.CryptoService;
import com.tech.sprj09.service.passChangeService;
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
	public String loginCheck(HttpServletRequest request, SearchVO searchVO, Model model)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException, NoSuchPaddingException,
			InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		System.out.println("=============loginCheck============");
		LocalDateTime serverTime = LocalDateTime.now();	
		request.setAttribute("serverTime", serverTime);
		
		String memid = request.getParameter("memid");
		String mempass = request.getParameter("mempass");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		//DB에서 아이디 권한 출력
		String loginCheck = dao.getMemberAdmin(memid);
		System.out.println(loginCheck);
		
		String shpwd = dao.shpwd(memid); //단방향 DB갖고오기
		String bcpwd = dao.bcpwd(memid); //양방향 DB갖고고오기
		
		System.out.println(bcpwd);
		System.out.println(shpwd);

		int using_id = dao.idLookup(memid); // 아이디 존재 여부 확인, 존재시 1 반환
		System.out.println("using_id" + using_id);
		
		if (using_id == 0) {
			System.out.println("--------아이디가 존재하지 않습니다---------");
			return "login";
		} else if (dao.shpwd(memid) == null || dao.shpwd(memid) == null) {
			System.out.println("--------시스템에러, 비밀번호 암호화 재진행-------");
			try {
				shpwd = CryptoService.sha512(mempass); // 단방향
				bcpwd = CryptoService.encryptAES256(mempass, shpwd); // 양방향
				dao.passUpdate(memid, shpwd, bcpwd);
				System.out.println("----------암호화 재설정 완료-----------");
			} catch (Exception e) {
				System.out.println("----------암호화 재설정 오류----------");
				e.printStackTrace();
			}
			//if 새로 시작
			if (mempass.equals(CryptoService.decryptAES256(bcpwd, shpwd))) {
				String dcreypt = CryptoService.decryptAES256(bcpwd, shpwd);
				System.out.println(dcreypt);
				System.out.println("----------암호화 재설정 후, 로그인 성공----------");
				request.setAttribute("loginCheck", loginCheck);
				request.setAttribute("loginId", memid);
				return "home";
			}else {
			System.out.println("----------암호화 재설정 후, 로그인 실패----------");
			return "login";
			}
		} else if (mempass.equals(CryptoService.decryptAES256(bcpwd, shpwd))) {
			String dcreypt = CryptoService.decryptAES256(bcpwd, shpwd);
			System.out.println(dcreypt);
			System.out.println("----------로그인 성공----------");
			request.setAttribute("loginCheck", loginCheck);
			request.setAttribute("loginId", memid);
			return "home";
		} else {
			System.out.println("----------비밀번호가 틀렸습니다----------");
			return "login";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.invalidate();
		return "home";

	}
	
	//비밀번호 찾기폼으로
    @RequestMapping(value = "/findpassword", method = RequestMethod.GET)
    public String findPasswordView() {
        return "findpassword";
    }
    
    //비밀번호 변경폼으로
    @RequestMapping(value = "/passChangeform", method = RequestMethod.GET)
    public String passChange() {
        return "passChangeform";
    }
    
    //비밀번호 변경구현
	// 회원가입 기능
	@RequestMapping("/passChangeService")
	public String passChangeService(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=============passChangeService============");

		model.addAttribute("request", request);

		bServiceInter = new passChangeService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:login";
	}    
	

}
