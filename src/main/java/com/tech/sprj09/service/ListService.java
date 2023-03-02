package com.tech.sprj09.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.vopage.SearchVO;

@Service
public class ListService implements BServiceInter{
	
	private SqlSession sqlSession;
	
	public ListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>ListService");
		
//		model에서 request를 풀기
//		model을 Map로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		SearchVO searchVO=
				(SearchVO)map.get("searchVO");
		
		IDao dao=sqlSession.getMapper(IDao.class);
	
		String[] bsikloka=request.getParameterValues("searchType");	
		
//		if(brdtitle!=null) {//null처리
//			for (int i = 0; i < brdtitle.length; i++) {
//				System.out.println("aaa : "+brdtitle[i]);
//			}
//		}
		
		String sikloka="";
		String sikcontent="";
		
		if(bsikloka!=null) {
			for (String val : bsikloka) {
				if (val.equals("sikloka")) {
					model.addAttribute("sikloka","true");
					sikloka="sikloka";
				}else if (val.equals("sikcontent")) {
					model.addAttribute("sikcontent","true");
					sikcontent="sikcontent";
				}
			}
		}		
//		키워드 가져오기
		String searchKeyword=request.getParameter("sk");
		
		if(searchKeyword==null)
			searchKeyword="";
		
		model.addAttribute("resk",searchKeyword);
		
		System.out.println("keyword : "+searchKeyword);
		
		String strPage=request.getParameter("page");
		if (strPage==null) {
			strPage="1";
		}
		System.out.println("pagggggg : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		//토탈 글의 갯수 구하기
//		int total=dao.selectBoardTotCount();
		int total=0;
		if(sikloka.equals("sikloka") && sikcontent.equals("")) {
			total=dao.selectBoardTotCount1(searchKeyword);
		}else if(sikloka.equals("") && sikcontent.equals("sikcontent")) {
			total=dao.selectBoardTotCount2(searchKeyword);
		}else if(sikloka.equals("sikloka") && sikcontent.equals("sikcontent")) {
			total=dao.selectBoardTotCount3(searchKeyword);
		}else if(sikloka.equals("") && sikcontent.equals("")) {
			total=dao.selectBoardTotCount4(searchKeyword);
		}
				
//		System.out.println("total : "+total);
		searchVO.pageCalculate(total);
		
		//계산된 내용 출력
		System.out.println("totRow : "+total);
		System.out.println("clickpage : "+page);
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("pageTot : "+searchVO.getTotPage());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
	
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		
//		ArrayList<BoardDto> list=null;
		
		if(sikloka.equals("sikloka") && sikcontent.equals("")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"1");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"1"));
		}else if(sikloka.equals("") && sikcontent.equals("sikcontent")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"2");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"2"));
		}else if(sikloka.equals("sikloka") && sikcontent.equals("sikcontent")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"3");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"3"));
		}else if(sikloka.equals("") && sikcontent.equals("")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"4");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"4"));
		}
		
		//model.addAttribute("list",list);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVo",searchVO);
		
	}

}
