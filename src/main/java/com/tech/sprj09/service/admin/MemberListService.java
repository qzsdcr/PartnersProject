package com.tech.sprj09.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.service.BServiceInter;

public class MemberListService implements BServiceInter {
	private SqlSession sqlSession;

	public MemberListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>MemberListService");

		Map<String, Object> map = model.asMap();// map으로 변환
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		IDao dao = sqlSession.getMapper(IDao.class);

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		String searchtype = request.getParameter("searchType");

		// 기본값은 1=memid 로
		String selnum = "1";

		// searchtype null 처리를 안하면 널포인트 익셉션이 뜨고 진입이 안된다...
		if (searchtype != null) {

			if (searchtype.equals("MEMID")) {
				selnum = "1";
				System.out.println("memid ");
			}
			if (searchtype.equals("MEMNAME")) {
				selnum = "2";
				System.out.println("memname ");
			}

		}

		// 키워드 가져오기
		String searchKeyword = request.getParameter("searchName");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

		ArrayList<MemberDto> mlist = dao.mlist(searchKeyword, selnum);

		ArrayList<MemberDto> clist = dao.clist();

		model.addAttribute("mlist", mlist);

		model.addAttribute("clist", clist);
	}

}
