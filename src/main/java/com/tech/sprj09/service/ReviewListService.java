package com.tech.sprj09.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.ReviewDto;

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
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		ArrayList<ReviewDto> rdto=dao.reviewlist();
		
		model.addAttribute("reviewlist",rdto);
		
	}

}
