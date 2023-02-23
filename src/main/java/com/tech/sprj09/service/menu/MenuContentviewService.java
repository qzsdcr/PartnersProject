package com.tech.sprj09.service.menu;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.service.BServiceInter;

@Service
public class MenuContentviewService implements BServiceInter  {
	
	private SqlSession sqlSession;
	
	public MenuContentviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>MenuContentViewService");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		String menuid=request.getParameter("menuid");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		MenuDto dto=dao.menucontentview(menuid);
	
  
		
		
		
		model.addAttribute("menucontent_view",dto);
		
		

	}
}
