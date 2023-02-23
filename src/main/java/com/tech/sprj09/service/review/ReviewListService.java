package com.tech.sprj09.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.ReviewDto;
import com.tech.sprj09.service.BServiceInter;

@Service
public class ReviewListService implements BServiceInter{
	
	private SqlSession sqlSession;
	
	public ReviewListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewListService");
		
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String reviewno=request.getParameter("reviewno");
		String reviewlike=request.getParameter("reviewlike");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		dao.upLikeHit(reviewno,reviewlike);
		
		ArrayList<ReviewDto> rdto=dao.reviewList();
		
		model.addAttribute("reviewList",rdto);
		
	}

}
