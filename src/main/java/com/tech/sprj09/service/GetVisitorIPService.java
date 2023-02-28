package com.tech.sprj09.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.sprj09.dao.IDao;

public class GetVisitorIPService implements VisitorServiceInter {

	private SqlSession sqlSession;

	public GetVisitorIPService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(HttpServletRequest request, Model model) {

		// 접속자 IP 받아오기.
		String visitorIP = request.getHeader("X-Forwarded-For");
		if (visitorIP == null || visitorIP.length() == 0 || "unknown".equalsIgnoreCase(visitorIP)) {
			visitorIP = request.getRemoteAddr();
			System.out.println("visitorIP : " + visitorIP);
		}

		// Get the IP address of the local host
		String localIP = null;
		try {
			localIP = InetAddress.getLocalHost().getHostAddress();
			System.out.println("local IP : " + localIP);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		// Check if visitorIP is the loopback address or the local IP
		if ("0:0:0:0:0:0:0:1".equals(visitorIP) || "127.0.0.1".equals(visitorIP) || visitorIP.equals(localIP)) {
			visitorIP = localIP;
		}

		// 모델에 IP 담기 (정상작동 TEST 후 삭제)
		model.addAttribute("visitorIP", visitorIP);

		// db에 연결해서 sql DB저장은 dao에서 처리
		// 같은 날짜에 중복 IP 체크해서 저장.
		IDao dao = sqlSession.getMapper(IDao.class);
		String visitTime = new SimpleDateFormat("yyyy/MM/dd HH:mm").format(new Date());
		int count = dao.checkDuplicateIP(visitorIP, visitTime);
		if (count == 0) {
			dao.VisitCount(visitorIP, visitTime);
			System.out.println("----------Visit Insert SQL 전달-----------");
		} else {
			System.out.println("----------Duplicate IP and Time, not inserted-----------");
		}

	}

	// 오늘 방문자수 count
	public int getTodayVisitorCount() {
		IDao dao = sqlSession.getMapper(IDao.class);
		return dao.getTodayCount();
	}

	// 총 방문자수 count
	public int getTotalVisitorCount() {
		IDao dao = sqlSession.getMapper(IDao.class);
		return dao.getTotalCount();
	}
}