package com.tech.sprj09.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.ReviewDto;
import com.tech.sprj09.service.BServiceInter;

@Service
public class ReviewUpdateService implements BServiceInter{
	
	private SqlSession sqlSession;
	
	public ReviewUpdateService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewUpdateService");
		
//		model에서 request를 풀기
//		model릏 Map으로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String reviewno=request.getParameter("reviewno");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		ReviewDto rdto=dao.reviewUpdate(reviewno);
		
		//리턴받은 db에 선택글을 모델에 담기
		model.addAttribute("review",rdto);
		
	}

}
