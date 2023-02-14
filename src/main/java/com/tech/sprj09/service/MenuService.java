package com.tech.sprj09.service;

import java.util.List;

import com.tech.sprj09.dto.MenuDto;

public interface MenuService {

	List<MenuDto> getMenuList(int sikno);
}
