package com.tech.sprj09.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class BoardDto {

	private int bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String filesrc;
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int bid, String bname, String btitle,
			String bcontent, Timestamp bdate, int bhit, int bgroup,
			int bstep, int bindent) {
		this.bid = bid;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
	}


	
}
