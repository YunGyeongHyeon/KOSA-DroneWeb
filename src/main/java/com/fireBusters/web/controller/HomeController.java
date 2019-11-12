package com.fireBusters.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	@RequestMapping("/")
	public String main() {
		return "/user/main";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "/user/main";
	}
	@RequestMapping("/map")
	public String map() {
		return "/user/map";
	}

	@RequestMapping("/complete")
	public String complete(double lat, double lon, HttpSession session) throws Exception {
		return "/user/complete";
		
	}

	@RequestMapping("/exception")
	public String exception() {
		return "/user/exception";
	}

}