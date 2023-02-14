package com.tech.sprj09.service.sikdang;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.SikdangDto;
import com.tech.sprj09.service.BServiceInter;

import lombok.NoArgsConstructor;

@Service
@NoArgsConstructor
public class SListService implements BServiceInter {
	private SqlSession sqlSession;

	public SListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>>>>>>Blist");
		System.out.println(">>>>>>>>DB접속 셀렉트");
		IDao dao = sqlSession.getMapper(IDao.class);

		// model 에서 request
		Map<String, Object> map = model.asMap();// map으로 변환
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		String searchtype = request.getParameter("searchType2");

		// 기본값은 1=memid 로
		String selnum = "3";

		// searchtype null 처리를 안하면 널포인트 익셉션이 뜨고 진입이 안된다...
		if (searchtype != null) {

			if (searchtype.equals("SIKNO")) {
				selnum = "3";
				System.out.println("SIKNO ");
			}
			if (searchtype.equals("SIKNAME")) {
				selnum = "4";
				System.out.println("SIKNAME ");
			}

		}

		// 키워드 가져오기
		String searchKeyword = request.getParameter("searchName2");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

		ArrayList<SikdangDto> list = dao.slist(searchKeyword, selnum);
		model.addAttribute("list", list);

		ArrayList<SikdangDto> sikdangchartlist = dao.sikdangchartlist();
		model.addAttribute("sikdangchartlist", sikdangchartlist);

	}
}
