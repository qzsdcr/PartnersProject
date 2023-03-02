package com.tech.sprj09.service.sikdang;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;

public class SikDangWriteService implements BServiceInter {
	private SqlSession sqlSession;

	
	public SikDangWriteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>>>>>SikDangWriteService");
		//model 에서 request
		Map<String, Object> map=model.asMap();//map으로 변환
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		// upload code
		String attachPath="resources\\sikupload\\";
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		String path="C:\\2023spring\\springwork1\\PartnersProject\\src\\main\\webapp\\resources\\sikupload";
		
		 System.out.println("request getContentType : " + request.getContentType());

		
		
		MultipartRequest req=null;
		try {
			
			 if (-1 < request.getContentType().indexOf("multipart/form-data")) {
			
			req=new MultipartRequest(request, path, 1024*1024*20, "utf-8",
					new DefaultFileRenamePolicy());//r같은 파일명을 정책대로 리네임 하겠다
			    }
			    
	
		  
		   }catch (Exception e) {
		    e.printStackTrace();
		    throw new RuntimeException("MultipartRequest 생성 중 오류 발생: " + e.getMessage());
		   }

		 
		
		String sikno =req.getParameter("sikno");
		String sikloca = req.getParameter("sikloca");
		String sikname = req.getParameter("sikname");
		String sikcontent = req.getParameter("sikcontent");
		String sikaddress = req.getParameter("sikaddress");
		String sikaddress2 = req.getParameter("sikaddress2");
		String siktel = req.getParameter("siktel");
		String fname= req.getFilesystemName("file");
		
		
		
		if(fname==null) {
			fname="";
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.sikwrite(sikno,sikloca,sikname,sikcontent,sikaddress,sikaddress2,siktel,fname);
		System.out.println("적힌 내용 "+sikno+","+sikloca+","+sikname+","+sikcontent+","+sikaddress+","+sikaddress2+","+siktel+","+fname);
	}

}
