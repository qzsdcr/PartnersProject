package com.tech.sprj09.dto;



import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDto {
	private int memuid;
	private String menulist;
	private Timestamp menudate;
	private String menufilesrc;
}
