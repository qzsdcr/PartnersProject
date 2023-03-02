package com.tech.sprj09.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SikdangDto{
	public SikdangDto() {
		// TODO Auto-generated constructor stub
	}
	
	private int sikno;
	private String sikloca; //지역
	private String sikname; //식당이름
	private String sikcontent; //식당소개
	private String sikaddress; //식당주소 
	private String siktel; //식당전화번호
	private Timestamp sikdate; //식당 글 업로드 날짜
	private int sikhit; // 식당조회수
	private String sikopenclose; //영업일
	private String filesrc; //첨부파일(이미지)
	
	
	public SikdangDto(int sikno, String sikloca, String sikname, String sikcontent, String sikaddress, String siktel,
			Timestamp sikdate, int sikhit, String sikopenclose, String filesrc) {

		
		this.sikno = sikno;
		this.sikloca = sikloca;
		this.sikname = sikname;
		this.sikcontent = sikcontent;
		this.sikaddress = sikaddress;
		this.siktel = siktel;
		this.sikdate = sikdate;
		this.sikhit = sikhit;
		this.sikopenclose = sikopenclose;
		this.filesrc = filesrc;
	}
	
	

}
