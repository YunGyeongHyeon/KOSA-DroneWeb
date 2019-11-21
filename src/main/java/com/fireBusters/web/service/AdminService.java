package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dto.AcBoardPicture;
import com.fireBusters.web.dao.AdminDao;
import com.fireBusters.web.dto.AcBoard;
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

	public List<ObBoard> selectObBoardList(int obid, int startRowNo, int endRowNo, String report_handle) {
		List<ObBoard> obBoardList = adminDao.selectObBoardList(obid, startRowNo, endRowNo, report_handle);
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

	public int getReportTotalRowNo(int fire_station_id) {
		int totalRowNum = adminDao.selectReportTotalRowNo(fire_station_id);
		return totalRowNum;
	}

	public int getTotalRowNo(int fire_station_id, String report_handle) {
		int totalRowNum = adminDao.selectTotalRowNo(fire_station_id, report_handle);
		return totalRowNum;
	}

	public int getTotalPictureRowNo() {
		int totalRowNum = adminDao.selectTotalPictureRowNo();
		return totalRowNum;
	}

	public void updateHandleY(int reportNo) {
		adminDao.updateHandleY(reportNo);
	}

	public void updateHandleR(int reportNo) {
		adminDao.updateHandleR(reportNo);
	}
	public void updateAccidentPath(String path, int reportNo) {
		adminDao.updateAccidentPath(path, reportNo);
	}
	
	public void updateObservePath(String path, int reportNo) {
		adminDao.updateObservePath(path, reportNo);
	}
	
	public List<AcBoard> selectAcBoardList(int abid, int startRowNo, int endRowNo, String report_handle) {
		List<AcBoard> acBoardList = adminDao.selectAcBoardList(abid, startRowNo, endRowNo, report_handle);
		return acBoardList;
	}

	public AdminFireStation selectAcFireStation(int afs) {
		AdminFireStation station = adminDao.selectAcFireStation(afs);
		return station;
	}

	public List<AcBoardPicture> selectAcBoardPicture(int abp) {
		List<AcBoardPicture> acBoardPicture = adminDao.selectAcBoardPicture(abp);
		return acBoardPicture;
	}

	public void insertAccident(int reportNo) {
		adminDao.insertAccident(reportNo);
	}

	public void insertObserve(int reportNo) {
		adminDao.insertObserve(reportNo);
	}

	public void selectObserve(int reportNo) {
		adminDao.selectObserve(reportNo);
	}
	public void selectAccident(int reportNo) {
		adminDao.selectAccident(reportNo);
	}

	public String selectPathPoint(int reportNo) {
		String path = adminDao.selectPathPoint(reportNo);
		return path;
	}
	
	public String selectPathPoint2(int reportNo) {
		String path = adminDao.selectPathPoint2(reportNo);
		return path;
	}
}
