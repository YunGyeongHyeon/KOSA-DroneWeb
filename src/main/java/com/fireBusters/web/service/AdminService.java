package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.AdminDao;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminMember;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public LoginResult login(String adminId, String adminPassword) {
		
		AdminMember member = adminDao.selectAdmin(adminId);
		
		
		System.out.println("서비스 : "+member);
		if(member == null) {
			return LoginResult.FAIL_ADMINID;
		} else {
			if(adminPassword.equals(member.getAdminPassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_ADMINPASSWORD;
			}
		}
	}

	public List<AdminBoard> selectReport(String name) {
		List<AdminBoard> report= adminDao.selectReport(name);
		return report;
	}
}
