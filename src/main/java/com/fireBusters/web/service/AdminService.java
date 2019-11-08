package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.AdminDao;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.AdminMember;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public LoginResult login(int fire_station_id, String fire_station_password) {
		AdminMember member = adminDao.selectAdmin(fire_station_id);
		if (member == null) {
			return LoginResult.FAIL_ADMINID;
		} else {
			if (fire_station_password.equals(member.getFire_station_password())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_ADMINPASSWORD;
			}
		}
	}

	public List<AdminBoard> selectReport(int id, int startRowNo, int endRowNo) {
		List<AdminBoard> report = adminDao.selectReport(id, startRowNo, endRowNo);
		return report;
	}

	public AdminFireStation selectFireStation(int fire_station_id) {
		AdminFireStation station = adminDao.selectFireStation(fire_station_id);
		return station;
	}

	public List<AdminLatLon> selectPoint() {
		List<AdminLatLon> aLatLon = adminDao.selectPoint();
		return aLatLon;
	}

	public List<ObBoard> selectObBoardList(int obid, int startRowNo, int endRowNo) {
		List<ObBoard> obBoardList = adminDao.selectList(obid, startRowNo, endRowNo);
		return obBoardList;

	}

	public AdminFireStation selectObFireStation(int ofs) {
		AdminFireStation station = adminDao.selectObFireStation(ofs);
		return station;
	}

	public List<ObBoardPicture> selectObBoardPicture(int obp) {
		List<ObBoardPicture> obBoardPicture = adminDao.selectObBoardPicture(obp);

		return obBoardPicture;
	}

	public int getTotalRowNo() {
		int totalRowNum = adminDao.selectTotalRowNo();
		return totalRowNum;
	}

	public int getTotalPictureRowNo() {
		int totalRowNum = adminDao.selectTotalPictureRowNo();
		return totalRowNum;
	}
}
