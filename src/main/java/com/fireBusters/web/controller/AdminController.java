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
import com.fireBusters.web.dto.testMember;
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
		if (error != null) {
			if (error.equals("fail_fire_station_id")) {
				model.addAttribute("fire_station_idError", "*아이디가 존재하지 앖습니다.");
			} else if (error.equals("fail_fire_station_password")) {
				model.addAttribute("fire_station_passwordError", "*패스워드가 틀렀습니다.");
			}
		}
		return "admin/loginForm";
	}


	@PostMapping("/login")
	public String login(int fire_station_id, String fire_station_password, HttpSession session) {
		LoginResult result = service.login(fire_station_id, fire_station_password);
		if (result == LoginResult.FAIL_ADMINID) {
			return "redirect:/admin/loginForm?error=fail_fire_station_id";
		} else if (result == LoginResult.FAIL_ADMINPASSWORD) {
			return "redirect:/admin/loginForm?error=fail_fire_station_password";//
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
	public String content(Model model, HttpSession session) {
		
		List<AdminBoard> board = service.selectReport((int)session.getAttribute("fire_station_id"));
		model.addAttribute("board",board);
		
		return "admin/content";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("fire_station_id");
		return "redirect:/admin/loginForm";
	}
	
	@RequestMapping("/test")
	public String test() {
		testMember test = service.selectTest(3);
		System.out.println(test.getFire_lat());
		return "redirect:/admin/content";
	}

}