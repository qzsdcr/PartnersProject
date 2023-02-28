package com.tech.sprj09.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tech.sprj09.dto.SikdangDto;
import com.tech.sprj09.service.SikdangServiceInter;;

@Controller
public class SikdangController {
	
    @Autowired
    private SqlSession sqlSession;
    
    @Autowired
    private SikdangServiceInter sikdangService;

    // Sikdang 등록 폼으로 이동
    @RequestMapping(value = "/sikdangRegForm", method = RequestMethod.GET)
    public String sikdangRegForm(HttpServletRequest request, Model model) {
        return "sikdangRegForm";
    }
    
	@PostMapping("/sikdangReg")
	public String sikdangRegForm(@RequestParam("sikname") String sikname, 
			@RequestParam("sikloca") String sikloca, 
			@RequestParam("siktel") String siktel, 
			@RequestParam("sikaddress") String sikaddress, 
			@RequestParam("sikaddress2") String sikaddress2,
			@RequestParam("sikopenclose") String sikopenclose, 
			@RequestParam("sikcontent") String sikcontent, 
			@RequestParam("sikwriter") String sikwriter, 
			@RequestParam("sikfile") MultipartFile sikfile,
			Model model) throws Exception {
		
		//파일 저장 경로 설정
		String uploadPath = "C:/Users/tech/Documents/upload/";
		
		//업로드한 파일이 있는지 확인
		if(!sikfile.isEmpty()) {
			String fileName = sikfile.getOriginalFilename();
			File dest = new File(uploadPath + fileName);
			try {
				//파일 저장
				sikfile.transferTo(dest);
				//DB에 저장할 파일 경로 설정
				String filesrc = "/upload/" + fileName;
				//SikdangDto에 데이터 저장
				SikdangDto sikdangDto = new SikdangDto();
				sikdangDto.setSikname(sikname);
				sikdangDto.setSikloca(sikloca);
				sikdangDto.setSiktel(siktel);
				sikdangDto.setSikaddress(sikaddress + " " + sikaddress2);
				sikdangDto.setSikopenclose(sikopenclose);
				sikdangDto.setSikcontent(sikcontent);
				sikdangDto.setFilesrc(filesrc);
				sikdangDto.setSikdate(new Timestamp(System.currentTimeMillis()));
				
				//DB에 데이터 저장
				sikdangService.insertSikdang(sikdangDto);
				
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "파일 업로드에 실패했습니다.");
				return "error";
			}
		} else {
			//파일이 없는 경우
			SikdangDto sikdangDto = new SikdangDto();
			sikdangDto.setSikname(sikname);
			sikdangDto.setSikloca(sikloca);
			sikdangDto.setSiktel(siktel);
			sikdangDto.setSikaddress(sikaddress + " " + sikaddress2);
			sikdangDto.setSikopenclose(sikopenclose);
			sikdangDto.setSikcontent(sikcontent);
			sikdangService.insertSikdang(sikdangDto);
			}
			return "redirect:/sikdangList";
			}

}