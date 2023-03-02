package com.tech.sprj09.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ReviewDto extends MemberDto{
	
	private int reviewno; // 리뷰 고유번호
	private int memno; //회원 고유번호
	private int sikno; //식당 고유번호
	private String reviewtitle; //리뷰 제목
	private String reviewcontent; //리뷰 내용
	private int reviewlike; //도움이 돼요
	private Timestamp reviewdate; //작성된 날짜
	private int spoon; //별점
	
	private int singo; //신고
	private String reviewfile; //리뷰 작성시 첨부파일(이미지)
	
	private String rememid; //리뷰 작성 후 memid 두글자 이후 * 처리
	
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}


	public ReviewDto(int reviewno, int memno, int sikno, String reviewtitle, String reviewcontent, int reviewlike,
			Timestamp reviewdate, int spoon,int gsikno, int singo, String reviewfile,String rememid) {

		this.reviewno = reviewno;
		this.memno = memno;
		this.sikno = sikno;
		this.reviewtitle = reviewtitle;
		this.reviewcontent = reviewcontent;
		this.reviewlike = reviewlike;
		this.reviewdate = reviewdate;
		this.spoon = spoon;
	
		this.singo = singo;
		this.reviewfile = reviewfile;
	}
	

}
