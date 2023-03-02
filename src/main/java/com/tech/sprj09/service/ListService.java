package com.tech.sprj09.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.vopage.SearchVO;

@Service
public class ListService implements BServiceInter {

	private SqlSession sqlSession;

	public ListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ListService");

//		model에서 request를 풀기
//		model을 Map로 변환

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		String url = request.getRequestURI();
//		db접속 select처리
//		BoardDao dao=new BoardDao();
		IDao dao = sqlSession.getMapper(IDao.class);

		String com = request.getParameter("com");
		String[] bsikloca = request.getParameterValues("searchType");
		if (com == null)
			com = "";

		/*
		 * String sikloka=""; String sikcontent="";
		 */

		String sikloca = "";
		String sikname = "";

		if (bsikloca != null) {
			for (String val : bsikloca) {
				if (val.equals("sikloca")) {
					model.addAttribute("sikloca", "true");
					sikloca = "sikloca";
				} else if (val.equals("sikname")) {
					model.addAttribute("sikname", "true");
					sikname = "sikname";
				}
			}
		}
//		키워드 가져오기
		String searchKeyword = request.getParameter("sk");

		if (searchKeyword == null)
			searchKeyword = "";

		model.addAttribute("resk", searchKeyword);

		System.out.println("keyword : " + searchKeyword);

		String strPage = request.getParameter("page");
		if (strPage == null) {
			strPage = "1";
		}
		System.out.println("pagggggg : " + strPage);

		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);

		// 토탈 글의 갯수 구하기
//		int total=dao.selectBoardTotCount();
		int total = 0;

		if (sikloca.equals("sikloca") && sikname.equals("sikname")) {
			total = dao.selectBoardTotCount1(searchKeyword, com);
		} else if (sikloca.equals("") && sikname.equals("")) {
			total = dao.selectBoardTotCount2(searchKeyword, com);
		}

//		System.out.println("total : "+total);
		searchVO.pageCalculate(total);

		// 계산된 내용 출력
		System.out.println("totRow : " + total);
		System.out.println("clickpage : " + page);
		System.out.println("pageStart : " + searchVO.getPageStart());
		System.out.println("pageEnd : " + searchVO.getPageEnd());
		System.out.println("pageTot : " + searchVO.getTotPage());
		System.out.println("rowStart : " + searchVO.getRowStart());
		System.out.println("rowEnd : " + searchVO.getRowEnd());

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		if (url.indexOf("list") > -1) {
			rowEnd = 100000000;
		} else if (url.indexOf("searchpage") > -1) {
			rowEnd = 100000000;
		}

//		ArrayList<BoardDto> list=null;

		if (sikloca.equals("sikloca") && sikname.equals("sikname")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"1");
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "1", com));
			model.addAttribute("gslist", dao.gslist(rowStart, rowEnd, searchKeyword, "1", com));
			model.addAttribute("gllist", dao.gllist(rowStart, rowEnd, searchKeyword, "1", com));
			model.addAttribute("yelist", dao.yelist(rowStart, rowEnd, searchKeyword, "1", com));
			model.addAttribute("gnlist", dao.gnlist(rowStart, rowEnd, searchKeyword, "1", com));
			model.addAttribute("pklist", dao.pklist(rowStart, rowEnd, searchKeyword, "1", com));

		} else if (sikloca.equals("") && sikname.equals("")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"2");
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "2", com));
			model.addAttribute("gslist", dao.gslist(rowStart, rowEnd, searchKeyword, "2", com));
			model.addAttribute("gllist", dao.gllist(rowStart, rowEnd, searchKeyword, "2", com));
			model.addAttribute("yelist", dao.yelist(rowStart, rowEnd, searchKeyword, "2", com));
			model.addAttribute("gnlist", dao.gnlist(rowStart, rowEnd, searchKeyword, "2", com));
			model.addAttribute("pklist", dao.pklist(rowStart, rowEnd, searchKeyword, "2", com));

		}

		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchVO);

	}

}
