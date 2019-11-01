package com.fireBusters.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.service.AdminService;
import com.fireBusters.web.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService service;
	@Autowired
	private AdminService Adminservice;

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
	public String complete(double lat, double lon, HttpSession session) {
		List<AdminLatLon> aLatLon = Adminservice.selectPoint();
		int n = 0;
		for (int i = 0; i < ((int) aLatLon.size()); i += 4) {
			System.out.println("까볼까? : " + i);
			if ((double)aLatLon.get(i).getFire_lat() < lat && lat < (double)aLatLon.get(i + 2).getFire_lat()
					&& (double)aLatLon.get(i).getFire_lon() < lon && lon < (double)aLatLon.get(i + 2).getFire_lon()) {
					System.out.println("드렁왔나요?");
					service.writeLocation(lat, lon, (int)aLatLon.get(i).getFire_station_id());
					n = 1;
			}
		}		
		if(n == 0) {
			return "/user/exception";
		}
		return "/user/complete";
	}

	@RequestMapping("/exception")
	public String exception() {
		return "/user/exception";
	}

}