package com.tech.sprj09.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.sprj09.dao.IDao;

@Service
public class JoinService implements BServiceInter {
	
	private SqlSession sqlSession;
	
	public JoinService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>JoinService");
		
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		String memid=request.getParameter("memid"); //아이디1
		String mempass=request.getParameter("mempass"); //비밀번호2
		String memname=request.getParameter("memname"); //이름3
		String membirth=request.getParameter("membirth"); //주민등록4
		String memsex=request.getParameter("memsex"); //성별5
		String mememail=request.getParameter("mememail"); //이메일6
		String mempnum=request.getParameter("mempnum"); // 핸드폰7
		String memaddress=request.getParameter("memaddress"); // 선호지역8
		String memlikemenu=request.getParameter("memlikemenu"); // 선호메뉴9
		
		System.out.println(memsex);
		System.out.println(memaddress);
		System.out.println(memlikemenu);
		
//		db에 연결해서 sql write는 dao에서 처리
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.join(memid,mempass,memname,membirth,memsex,mememail,
				mempnum,memaddress,memlikemenu);		
		
//		BoardDao dao=new BoardDao();
//		dao.write(bname,btitle,bcontent);
		
	}

}