package com.tech.sprj09.service.menu;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.service.BServiceInter;
import com.tech.sprj09.vopage.SearchVO;

@Service
public class MenuListService implements BServiceInter {

	private  SqlSession sqlSession;


	public MenuListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}


	@Override
	public void execute(Model model) {
		
		System.out.println(">>>MenuListService");
		
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		SearchVO searchVO=
				(SearchVO)map.get("searchVO");
		
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		String[] brdtitle=request.getParameterValues("searchType");	
		String menudate="";
		String menulist="";
		
		if(brdtitle!=null) {
			for (String val : brdtitle) {
				if (val.equals("")) {
					model.addAttribute("menudate","true");
					menudate="menudate";
				}else if (val.equals("menulist")) {
					model.addAttribute("menulist","true");
					menulist="menulist";
				}
			}
		}		
		List<MenuDto> dto=dao.selectMenuList();
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
		
//		//토탈 글의 갯수 구하기
////		int total=dao.selectBoardTotCount();
//		int total=0;
//		if(menudate.equals("menudate") && menulist.equals("")) {
//			total=dao.selectBoardTotCount1(searchKeyword);
//		}else if(menudate.equals("") && menulist.equals("menulist")) {
//			total=dao.selectBoardTotCount2(searchKeyword);
//		}else if(menudate.equals("menudate") && menulist.equals("menulist")) {
//			total=dao.selectBoardTotCount3(searchKeyword);
//		}else if(menudate.equals("") && menulist.equals("")) {
//			total=dao.selectBoardTotCount4(searchKeyword);
//		}
//				
////		System.out.println("total : "+total);
//		searchVO.pageCalculate(total);
//		
//		//계산된 내용 출력
//		System.out.println("totRow : "+total);
//		System.out.println("clickpage : "+page);
//		System.out.println("pageStart : "+searchVO.getPageStart());
//		System.out.println("pageEnd : "+searchVO.getPageEnd());
//		System.out.println("pageTot : "+searchVO.getTotPage());
//		System.out.println("rowStart : "+searchVO.getRowStart());
//		System.out.println("rowEnd : "+searchVO.getRowEnd());
//	
//		int rowStart=searchVO.getRowStart();
//		int rowEnd=searchVO.getRowEnd();
//		
//
//		
//		if(menudate.equals("menudate") && menulist.equals("")) {
//
//			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"1"));
//		}else if(menudate.equals("") && menulist.equals("menulist")) {
//
//			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"2"));
//		}else if(menudate.equals("menudate") && menulist.equals("menulist")) {
////	
//			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"3"));
//		}else if(menudate.equals("") && menulist.equals("")) {
//
//			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"4"));
//		}
//		
		model.addAttribute("list",dto);
		
//		model.addAttribute("totRowcnt",total);
//		model.addAttribute("searchVo",searchVO);
//		
		
		

	}
}
