package com.fireBusters.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;
import com.fireBusters.web.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/obboard")
	public String obBoardList(Model model, HttpSession session) {
		List<ObBoard> obBoardList = service.selectObBoardList((int)session.getAttribute("fire_station_id"));
		AdminFireStation station = service.selectObFireStation((int)session.getAttribute("fire_station_id"));
		
		
		model.addAttribute("obBoardList", obBoardList);
		model.addAttribute("station", station);	
		
	return "board/observe_board";
	}
	
	@RequestMapping("/obBoardPicture")
	public String obBoardPicture(int report_no,  Model model, HttpSession session) {
		System.out.println("ㅓㅎ러홒호ㅓㅗ헣obBoardPicture:"+report_no);
		List<ObBoardPicture> obBoardPicture = service.selectObBoardPicture(report_no);
		
		model.addAttribute("obBoardPicture", obBoardPicture);
		
		return "board/obBoardPicture";
	}
	
	

}
