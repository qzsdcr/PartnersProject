package com.tech.sprj09.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.sprj09.dto.BoardDto;
import com.tech.sprj09.dto.MemberDto;
import com.tech.sprj09.dto.MenuDto;
import com.tech.sprj09.dto.SikdangDto;

public interface IDao {

	// 기본 리스트 ,디테일, 수정 ,삭제 ,리플 , 카테고리별 검색, 하위 리플 삭제 방지 !!시작!!
	public ArrayList<BoardDto> list(String sk, String selNum);

	public void write(String bname, String btitle, String bcontent, String fname);

	public BoardDto contentview(String gbid);

	public void upHit(String gbid);

	public BoardDto contentupdate(String gbid);

	public void modify(String bid, String bname, String btitle, String bcontent);

	public void delete(String bid);

	public BoardDto replyview(String gbid);

	public void reply(String bid, String bname, String btitle, String bcontent, String bgroup, String bstep,
			String bindent);

	public int replyShape(String bgroup, String bstep);

	public int selectBoardTotCount1(String searchKeyword);

	public int selectBoardTotCount2(String searchKeyword);

	public int selectBoardTotCount3(String searchKeyword);

	public int selectBoardTotCount4(String searchKeyword);

	public ArrayList<BoardDto> sonReply(int bgroup);
	
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

	public List<MenuDto> selectMenuList(int sikno); //메뉴 리스트 

}
