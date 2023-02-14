package com.tech.sprj09.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MenuDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService{
	
	private final SqlSession sqlSession;
	
	@Override
	public List<MenuDto> getMenuList(int sikno) {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		List<MenuDto> list = dao.selectMenuList(sikno);
		
		return list;
	}
}
