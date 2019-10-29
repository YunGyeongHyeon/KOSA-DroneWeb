package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.AdminDao;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.AdminMember;

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

	public AdminFireStation selectFireStation(int fire_station_id) {
		AdminFireStation station = adminDao.selectFireStation(fire_station_id);
		return station;
	}

	public List<AdminLatLon> selectPoint(int fire_station_id) {
		List<AdminLatLon> aLatLon = adminDao.selectPoint(fire_station_id);
		return aLatLon;
	}

}
