package com.tech.sprj09.dao;

import java.util.ArrayList;

import com.tech.sprj09.dto.BoardDto;
import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.dto.SikdangDto;

public interface IDao {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//회원가입 DBinsert
	public void join(String memid, String mempass, String memname, String memsex, String membirth, String mememail,
			String mempnum, String memaddress, String memlikemenu);

	public int loginLookup(String memid);

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


}
