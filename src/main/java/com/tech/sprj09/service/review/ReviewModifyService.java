package com.tech.sprj09.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.sprj09.dao.IDao;
import com.tech.sprj09.service.BServiceInter;

@Service
public class ReviewModifyService implements BServiceInter{
	
	private SqlSession sqlSession;
	
	public ReviewModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewModifyService");
		
//		model에서 request를 풀기
//		model릏 Map으로 변환
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
//		upload code
		String attachPath="resources\\upload\\";
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		System.out.println("uploadpathhhhh:"+uploadPath);
		
		//String path=uploadPath+attachPath;
		
		String path="C:\\2022spring\\springwork1\\partners4\\src\\main\\webapp\\resources\\upload";
		
		MultipartRequest req=null;
		try {
			req=new MultipartRequest(request, path, 1024*1024*20, "utf-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String reviewno=req.getParameter("reviewno");
		String reviewcontent=req.getParameter("reviewcontent");
		String spoon=req.getParameter("spoon");
		String rname=req.getFilesystemName("file");
		
		if (rname==null) {
			rname="";
		}
		
		IDao dao=sqlSession.getMapper(IDao.class);
		
		dao.reviewModify(reviewno,reviewcontent,spoon,rname);
		
	}

}
