package com.tech.sprj09.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.sprj09.dto.SikdangDto;

@Service
public class SikdangServiceImpl implements SikdangServiceInter {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertSikdang(SikdangDto sikdangDto) throws Exception {
		sqlSession.insert("sikdangMapper.insertSikdang", sikdangDto);
	}

}