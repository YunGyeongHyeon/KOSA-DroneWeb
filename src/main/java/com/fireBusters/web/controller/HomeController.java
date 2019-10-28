package com.fireBusters.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	@RequestMapping("user/map")
	public String map() {
		
		return "/user/map";
	}

	@RequestMapping("user/complete")
	public String complete() {
		return "/user/complete";
	}
}