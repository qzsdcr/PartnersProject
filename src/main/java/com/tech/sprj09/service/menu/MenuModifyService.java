package com.tech.sprj09.service.menu;

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
public class MenuModifyService implements BServiceInter {

	private SqlSession sqlSession;

	public MenuModifyService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("menumodifyuploadpathhhhh:" + uploadPath);

		String path = "C:\\2022spring\\springwork1\\Partenersproject\\src\\main\\webapp\\resources\\menuupload"; // 경로 수정 필요 

		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {
			// TODO: handle exception
		}

		String menulist = req.getParameter("menulist");
		String menudate = req.getParameter("menudate");
		String menufilesrc = req.getFilesystemName("file");
		
		if (menufilesrc == null)
			menufilesrc = "";


//		db에 연결해서 sql write는 dao에서 처리
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.menumodify(menulist, menudate, menufilesrc);

	}
}