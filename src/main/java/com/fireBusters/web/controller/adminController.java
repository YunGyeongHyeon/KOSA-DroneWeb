package com.fireBusters.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class adminController {
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@RequestMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping("/content")
	public String content() {
		return "admin/content";
	}
}
