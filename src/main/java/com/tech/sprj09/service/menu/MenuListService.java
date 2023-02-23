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
		

		model.addAttribute("list",dto);		
		
		

	}
}
