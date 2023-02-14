package com.tech.sprj09.service.sikdang;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;

@Service
public class SikDeModifyService implements BServiceInter{
	private SqlSession sqlSession;
	
	public SikDeModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>SikDeModifyService");
		
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		
		String bid=request.getParameter("bid");
		String sikopenclose=request.getParameter("sikopenclose");
		
//		BoardDao dao=new BoardDao();
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.sikdemodify(bid,sikopenclose);
		
	}

}
