package com.tech.sprj09.service.menu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.service.BServiceInter;

@Service
public class MenuCalendarDetailService implements BServiceInter {

	private SqlSession sqlSession;

	public MenuCalendarDetailService(SqlSession sqlSession) {

		this.sqlSession = sqlSession;

	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>캘린더디테일서비스지나감");

		Map<String, Object> map = model.asMap();
		String sikno = (String) map.get("sikno");
		String menudate = (String) map.get("menudate");

		IDao dao = sqlSession.getMapper(IDao.class);
		MenuDto dto = dao.calendardetail(sikno, menudate);
		if (dto != null) {
		    model.addAttribute("calendarDetail", dto);
		}
	}

}
