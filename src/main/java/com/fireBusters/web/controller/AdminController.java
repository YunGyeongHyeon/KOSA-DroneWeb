package com.fireBusters.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;
import com.fireBusters.web.service.AdminService;
import com.fireBusters.web.service.LoginResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService service;

	@RequestMapping("/main")
	public String main() {
		return "admin/loginForm";
	}

	@RequestMapping("/loginForm")
	public String loginForm(String error, Model model) {
		try {
		if (error != null) {
			if (error.equals("fail_fire_station_id")) {
				model.addAttribute("fire_station_idError", "*아이디가 존재하지 앖습니다.");
			} else if (error.equals("fail_fire_station_password")) {
				model.addAttribute("fire_station_passwordError", "*패스워드가 틀렀습니다.");
			}
		}
		}catch(Exception e){
			model.addAttribute("fire_station_idError", "제대로 입력해주세요.");
		}
		return "admin/loginForm";
	}


	@PostMapping("/login")
	public String login(int fire_station_id, String fire_station_password, HttpSession session) {
		LoginResult result = service.login(fire_station_id, fire_station_password);
		if (result == LoginResult.FAIL_ADMINID) {
			session.setAttribute("fire_station_idError", "* 아이디가 존재하지 않습니다."); 
			return "redirect:/admin/main";
		} else if (result == LoginResult.FAIL_ADMINPASSWORD) {
			session.setAttribute("fire_station_passwordError", "* 비밀번호가 존재하지 않습니다.");
			return "redirect:/admin/main";
		}
		session.setAttribute("fire_station_id", fire_station_id);
		System.out.println(session.getAttribute("fire_station_id"));
		return "admin/complete";
	}

	@GetMapping("/complete")
	public String complete() {
		return "redirect:/admin/content";
	}
	
	
	
	@RequestMapping("/content")
	public String content(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon) {
		if(session.getAttribute("fire_station_id")==null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}
		List<AdminBoard> board = service.selectReport((int)session.getAttribute("fire_station_id"));
		AdminFireStation station = service.selectFireStation((int)session.getAttribute("fire_station_id")); 
		
		model.addAttribute("board",board);
		model.addAttribute("station",station);
		return "admin/content";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("fire_station_id");
		return "redirect:/admin/loginForm";
	}
	
	@RequestMapping("/report")
	public String report(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon) {
		if(session.getAttribute("fire_station_id")==null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}
		List<AdminBoard> board = service.selectReport((int)session.getAttribute("fire_station_id"));
		AdminFireStation station = service.selectFireStation((int)session.getAttribute("fire_station_id")); 
		
		model.addAttribute("board",board);
		model.addAttribute("station",station);
		return "admin/report";
	}
	@RequestMapping("/picture")
	public String picture(Model model, HttpSession session, AdminFireStation fireStation, AdminLatLon adminLatLon) {
		if(session.getAttribute("fire_station_id")==null) {
			System.out.println("아이디 없습니다.");
			return "redirect:/admin/loginForm";
		}
		
		List<ObBoard> obBoardList = service.selectObBoardList((int)session.getAttribute("fire_station_id"));
		AdminFireStation station = service.selectObFireStation((int)session.getAttribute("fire_station_id"));
		
		model.addAttribute("obBoardList", obBoardList);
		model.addAttribute("station", station);	
		return "admin/observe_board";
	}
	@RequestMapping("/obBoardPicture")
	public String obBoardPicture(int report_no,  Model model, HttpSession session) {
		List<ObBoardPicture> obBoardPicture = service.selectObBoardPicture(report_no);
		
		model.addAttribute("obBoardPicture", obBoardPicture);
		
		return "admin/obBoardPicture";
	}
	
	@RequestMapping("/observe")
	public String observe() {
	
		return "admin/observe";
	}
	
	@RequestMapping("/observe_map")
	public String observe_map() {
		return "admin/observe_map";
	}
}