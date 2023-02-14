package com.tech.sprj09.dto;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ReviewDto {
	
	private int reviewno; // 리뷰 고유번호 
	private String reviewtitle; //리뷰 제목
	private String reviewgood; // 식당 좋은점
	private String reviewbad; //식당 나쁜점 
	private String reviewwant; // 식당 원하는 점 
	private String reviewlike; // 도움이 돼요
	private Timestamp reviewdate; // 작성된 날짜 저장 
	private int spoon; // 회원이 매긴 스푼
	private int taste; // 맛 
	private int price; // 가격
	private int clean; // 청결도 
	private int singo; // 신고 
	
	
	public ReviewDto(int reviewno, String reviewtitle, String reviewgood, String reviewbad, String reviewwant,
			String reviewlike, Timestamp reviewdate, int spoon, int taste, int price, int clean, int singo) {

		this.reviewno = reviewno;
		this.reviewtitle = reviewtitle;
		this.reviewgood = reviewgood;
		this.reviewbad = reviewbad;
		this.reviewwant = reviewwant;
		this.reviewlike = reviewlike;
		this.reviewdate = reviewdate;
		this.spoon = spoon;
		this.taste = taste;
		this.price = price;
		this.clean = clean;
		this.singo = singo;
	}
	

}
