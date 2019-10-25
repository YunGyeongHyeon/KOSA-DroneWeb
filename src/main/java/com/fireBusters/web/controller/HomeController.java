package com.fireBusters.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class HomeController {
	@RequestMapping("/main")
	public String main() {
		return "user/main";
	}

	@RequestMapping("/map")
	public String map() {
		return "user/map";
	}

	@RequestMapping("/complete")
	public String complete() {
		return "user/complete";
	}

}
