package com.tech.sprj09.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface VisitorServiceInter {
	void execute(HttpServletRequest request, Model model);
}