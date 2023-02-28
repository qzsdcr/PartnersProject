package com.tech.sprj09.dto;



import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MenuDto {
	private int menuid; //메뉴 고유번호
	private int sikno;  //식단 고유넘버 
	private String menulist; // 식단
	private Timestamp menudate;//식단날짜
	private String menufilesrc;//식판 이미지 저장공간 
}
