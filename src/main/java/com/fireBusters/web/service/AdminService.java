package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.AdminDao;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminMember;
import com.fireBusters.web.dto.testMember;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public LoginResult login(int fire_station_id, String fire_station_password) {
		AdminMember member = adminDao.selectAdmin(fire_station_id);
		if(member == null) {
			return LoginResult.FAIL_ADMINID;
		} else {
			if(fire_station_password.equals(member.getFire_station_password())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_ADMINPASSWORD;
			}
		}
	}

	public List<AdminBoard> selectReport(int id) {
		List<AdminBoard> report= adminDao.selectReport(id);
		return report;
	}
	
	public testMember selectTest(int fire_station_id){
		testMember test = adminDao.selectTest(fire_station_id);
		return test;
	}
}
