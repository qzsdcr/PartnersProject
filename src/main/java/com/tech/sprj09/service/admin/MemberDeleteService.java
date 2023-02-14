package com.tech.sprj09.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.BoardDto;
import com.tech.sprj09.service.BServiceInter;


@Service
public class MemberDeleteService implements BServiceInter{

	private SqlSession sqlSession;
	
	public MemberDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>MemberDeleteService");
		
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		
		String bid=request.getParameter("bid");
		IDao dao=sqlSession.getMapper(IDao.class);
//		BoardDao dao=new BoardDao();
		dao.memberdelete(bid);
	
	}
	

}
