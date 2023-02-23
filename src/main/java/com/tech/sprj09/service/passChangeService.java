package com.tech.sprj09.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;

public class passChangeService implements BServiceInter {

	private SqlSession sqlSession;

	public passChangeService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>passChangeService");
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");		
	    
	    //param값 저장
		String memid=request.getParameter("memid"); //아이디1
		String mempass=request.getParameter("mempass"); //비밀번호2
		
		//암호화 처리
		String shpwd="";
		String bcpwd="";
		try {
			shpwd = CryptoService.sha512(mempass); //단방향
			bcpwd = CryptoService.encryptAES256(mempass, shpwd); //양방향
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		db에 연결해서 sql write는 dao에서 처리
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.passChange(memid,mempass,shpwd,bcpwd);
		System.out.println("----------insert SQL 전달-----------");
		
	}
}

