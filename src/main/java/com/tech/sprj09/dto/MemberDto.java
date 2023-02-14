package com.tech.sprj09.dto;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemberDto {
	public MemberDto() {

	}
	
	public int memno; // 회원 고유정보
	public String memid; // 회원 ID
	public String mempass; // 회원 PASS
	public String memname; // 회원 이름
	public String membirth; // 회원 나이
	public String memsex; // 회원 성별
	public String mememail; // 회원 이메일
	public String mempnum; // 회원 연락처
	public String memaddress;// 회원지역
	public String memlikemenu; // 회원이 선호하는 메뉴
	public Timestamp memjoindate; // 회원가입일
	public String memadmin; // ADMIN인지 일반 회원인지 구분하는 ...
	private String lv;
	private String sum;
	public MemberDto(int memno, String memid, String mempass, String memname, String membirth, String memsex,
			String mememail, String mempnum, String memaddress, String memlikemenu, Timestamp memjoindate, String memadmin,
			String lv, String sum) {
		super();
		this.memno = memno;
		this.memid = memid;
		this.mempass = mempass;
		this.memname = memname;
		this.membirth = membirth;
		this.memsex = memsex;
		this.mememail = mememail;
		this.mempnum = mempnum;
		this.memaddress = memaddress;
		this.memlikemenu = memlikemenu;
		this.memjoindate = memjoindate;
		this.memadmin = memadmin;
		this.lv = lv;
		this.sum = sum;
	}
	
	
	
	


	
}
