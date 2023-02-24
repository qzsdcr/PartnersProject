package com.tech.sprj09.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tech.sprj09.service.BServiceInter;

public class VisitCountController {
	@Controller
	public class UserController {
		BServiceInter bServiceInter;

		@Autowired
		private SqlSession sqlSession;

	}
}
