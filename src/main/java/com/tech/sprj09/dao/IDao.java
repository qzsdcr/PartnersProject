package com.tech.sprj09.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.dto.ReviewDto;
import com.tech.sprj09.dto.SikdangDto;

public interface IDao {

	public ArrayList<SikdangDto> list(int start,int end,String sk,String selNum);
	   
	public SikdangDto contentview(String gsikno);
	
	public ArrayList<ReviewDto> review(String memno,String sikno,String reviewtitle,String reviewcontent,String spoon,String reviewfile);
	
	public ArrayList<ReviewDto> reviewlist();
	
	public int selectBoardTotCount1(String searchKeyword);
	
	public int selectBoardTotCount2(String searchKeyword);
	
	public int selectBoardTotCount3(String searchKeyword);
	
	public int selectBoardTotCount4(String searchKeyword);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//회원가입 DBinsert
	public void join(String memid, String mempass, String memname, String memsex, String membirth, String mememail,
			String mempnum, String memaddress, String memlikemenu, String shpwd, String bcpwd);

	public int idLookup(String memid);

	public MemberDto login(String memid, String mempass);
	
	//admin 설정 정리/////////////////////////
	public ArrayList<MemberDto> mlist(String searchKeyword, String selnum);

	public MemberDto memberview(String bid);

	public void memberdelete(String bid);

	public void membermodify(String bid, String memadmin);
	//멤버 차트 리스트
	public ArrayList<MemberDto> clist();

	public ArrayList<SikdangDto> slist(String searchKeyword, String selnum);
	//식당 디테일
	public SikdangDto sikdeview(String bid);
	//식당 차트 리스트
	public ArrayList<SikdangDto> sikdangchartlist();

	public void sikdemodify(String bid, String sikopenclose);

	public void sikdedelete(String bid);

	public void sikdemultidelete(String bid);

	
	
	
	
	
	
	
	
	//메뉴 리스트 
	public List<MenuDto> selectMenuList(int sikno); 
	public List<MenuDto> selectMenuList();

	public void menuwrite(String menulist, String menudate, String menufilesrc);
	
	
	//로그인 암호화처리
	public String shpwd(String memid);

	public String bcpwd(String memid);
	
	//암호화 재설정, 초기 암호화 설정이 안되어 있을 때 작동
	public void passUpdate(String memid, String shpwd, String bcpwd);

	public void sikwrite(String sikno, String sikloca, String sikname, String sikcontent, String sikaddress,
			String sikaddress2, String siktel, String fname);

	//멤버 권한 가져오기
	public String getMemberAdmin(String memid);
	
	//비밀번호 변경
	public void passChange(String memid, String mempass, String shpwd, String bcpwd);
		
	//방문자수 DB insert
	public void VisitCount(String visitorIP, String visitTime);
	
	//중복IP 저장 방지
	public int checkDuplicateIP(String visitorIP, String visitTime);
	
	//오늘 방문자수 count
	public int getTodayCount();
	
	//총 방문자 수 count
	public int getTotalCount();
	
	//------------------유저페이지 기능----------
	//회원정보 조회
	public MemberDto getMember(String id);

	public void modifyMember(String memid, String mempass, String memname, String membirth, String memsex,
			String mememail, String mempnum, String memaddress, String memlikemenu, String shpwd, String bcpwd);

	public void deleteMember(String memid);

	

}
