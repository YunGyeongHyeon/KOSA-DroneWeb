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
			if (error.equals("fail_adminid")) {
				model.addAttribute("adminIdError", "*아이디가 존재하지 앖습니다.");
			} else if (error.equals("fail_adminpassword")) {
				model.addAttribute("adminPasswordError", "*패스워드가 틀렀습니다.");
			}
		}
		return "admin/loginForm";

	}


	@PostMapping("/login") 
	public String login(int fire_station_id, String fire_station_password, HttpSession session) {
		LoginResult result = service.login(fire_station_id, fire_station_password);
		if (result == LoginResult.FAIL_ADMINID) {
			return "redirect:/admin/loginForm?error=fail_adminid";
		} else if (result == LoginResult.FAIL_ADMINPASSWORD) {
			return "redirect:/admin/loginForm?error=fail_adminpassword";//
		}
		session.setAttribute("fire_station_id", fire_station_id);
		return "redirect:/admin/complete";
	}

	@GetMapping("/complete")
	public String complete() {
		return "admin/complete";
	}
	
	
	
	@PostMapping("/content")
	public String content(Model model, HttpSession session) {
		List<AdminBoard> board = service.selectReport((String)session.getAttribute("adminId"));
		model.addAttribute("board",board);
		
		return "admin/content";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminId");
		session.removeAttribute("fire_station_name");
		return "redirect:/admin/loginForm";
	}

}