package com.tech.sprj09.service.sikdang;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;

public class SikDeMultiDeleteService implements BServiceInter {

	private SqlSession sqlSession;

	public SikDeMultiDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>SikDeDeleteService");

//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String[] bid = request.getParameterValues("bid");
		int size=bid.length;
		for (int i = 0; i < size; i++) {
			IDao dao = sqlSession.getMapper(IDao.class);
			dao.sikdemultidelete(bid[i]);
		}
		
	
	
	}

}
