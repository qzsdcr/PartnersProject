package com.tech.sprj09.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.service.CryptoService;
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

		int loginCheck = -1; // 로그인체크용
		String memid = request.getParameter("memid");
		String mempass = request.getParameter("mempass");

		IDao dao = sqlSession.getMapper(IDao.class);

		String shpwd = dao.shpwd(memid);
		String bcpwd = dao.bcpwd(memid);
		System.out.println(bcpwd);
		System.out.println(shpwd);

		int using_id = dao.idLookup(memid); // 아이디 존재 여부 확인, 존재시 1 반환
		System.out.println("using_id" + using_id);
		
		if (using_id == 0) {
			loginCheck = -1;
			System.out.println("--------아이디가 존재하지 않습니다---------");
			return "login";
		} else if (dao.shpwd(memid) == null || dao.shpwd(memid) == null) {
			loginCheck = -2;
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
			if (mempass.equals(CryptoService.decryptAES256(bcpwd, shpwd))) {
				loginCheck = 1;
				String dcreypt = CryptoService.decryptAES256(bcpwd, shpwd);
				System.out.println(dcreypt);
				System.out.println("----------암호화 재설정 후, 로그인 성공----------");
				request.setAttribute("loginCheck", loginCheck);
				return "userPage";
			}else {
			System.out.println("----------암호화 재설정 후, 로그인 실패----------");
			return "login";
			}
		} else if (mempass.equals(CryptoService.decryptAES256(bcpwd, shpwd))) {
			loginCheck = 1;
			String dcreypt = CryptoService.decryptAES256(bcpwd, shpwd);
			System.out.println(dcreypt);
			System.out.println("----------로그인 성공----------");
			request.setAttribute("loginCheck", loginCheck);
			return "userPage";
		} else {
			loginCheck = -3;
			System.out.println("----------비밀번호가 틀렸습니다----------");
			return "login";
		}
	}
}