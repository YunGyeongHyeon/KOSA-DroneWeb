package com.fireBusters.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireBusters.web.dto.UserMember;
import com.fireBusters.web.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping("/")
	public String main() {
		return "/user/main";
	}

	@RequestMapping("/map")
	public String map() {
		
		return "/user/map";
	}

	@RequestMapping("/complete")
	public String complete(double lat, double lon) {
		service.writeLocation(lat, lon);
		return "/user/complete";
	}
	
	@RequestMapping("/exception")
	public String exception() {
		return "/user/exception";
	}

}