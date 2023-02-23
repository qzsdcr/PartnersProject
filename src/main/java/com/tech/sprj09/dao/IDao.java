package com.tech.sprj09.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.dto.SikdangDto;

public interface IDao {

	
	   
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	public List<MenuDto> selectMenuList(int menuid, int sikno); 
	public List<MenuDto> selectMenuList();

	public List<MenuDto> menuwrite(String menulist, String menudate, String menufilesrc);
	public MenuDto menucontentview(String menuid);
	public MenuDto menucontentupdate(String menuid);
	public void menudelete(String menuid);
	public MenuDto menumodify(String menulist, String menudate, String menufilesrc);
	
	public MenuDto calendardetail(String sikno, String menudate);
	
	//로그인 암호화처리
	public String shpwd(String memid);

	public String bcpwd(String memid);
	
	//암호화 재설정, 초기 암호화 설정이 안되어 있을 때 작동
	public void passUpdate(String memid, String shpwd, String bcpwd);



}
