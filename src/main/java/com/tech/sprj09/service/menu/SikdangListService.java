package com.tech.sprj09.service.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.SikdangDto;
import com.tech.sprj09.service.BServiceInter;

@Service
public class SikdangListService implements BServiceInter {

	private SqlSession sqlSession;

	public SikdangListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {

		IDao dao = sqlSession.getMapper(IDao.class);
		List<SikdangDto> sikdangList = dao.sikdangList();

		model.addAttribute("sikdangList", sikdangList);
	}
}
