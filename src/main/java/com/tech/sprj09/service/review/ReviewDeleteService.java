package com.tech.sprj09.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;

@Service
public class ReviewDeleteService implements BServiceInter{
	
	private SqlSession sqlSession;
	
	public ReviewDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewDeleteService");
		
//		model에서 request를 풀기
//		model릏 Map으로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String reviewno=request.getParameter("reviewno");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		dao.reviewDelete(reviewno);
		
	}

}
