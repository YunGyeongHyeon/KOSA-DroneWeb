package com.fireBusters.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fireBusters.web.dto.AcBoard;
import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.AdminMember;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;
import com.fireBusters.web.dto.AcBoardPicture;

@Component
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminMember selectAdmin(int fire_station_id) {
		AdminMember member = sqlSessionTemplate.selectOne("adminMember.selectAdminMember", fire_station_id);
		return member;
	}

	public AdminFireStation selectFireStation(int fire_station_id) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.selectFireStation", fire_station_id);
		return station;
	}

	public List<AdminLatLon> selectPoint() {
		List<AdminLatLon> aLatLon = sqlSessionTemplate.selectList("adminMember.selectPoint");
		return aLatLon;
	}

	public List<AdminBoard> selectReport(int id, int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("id", id);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<AdminBoard> board = sqlSessionTemplate.selectList("adminMember.selectReport", map);
		return board;
	}

	public List<ObBoard> selectObBoardList(int obid, int startRowNo, int endRowNo, String report_handle) {
		Map<String, Object> map = new HashMap<>();
		map.put("obid", obid);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		map.put("report_handle", report_handle);
		List<ObBoard> obBoardList = sqlSessionTemplate.selectList("adminMember.obSelectList", map);
		return obBoardList;
	}

	public List<AcBoard> selectAcBoardList(int abid, int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("abid", abid);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<AcBoard> acBoardList = sqlSessionTemplate.selectList("adminMember.acSelectList", map);
		return acBoardList;
	}

	public List<ObBoardPicture> selectObBoardPicture(int obp) {
		List<ObBoardPicture> obBoardPicture = sqlSessionTemplate.selectList("adminMember.obPicture", obp);
		return obBoardPicture;
	}

	public List<AcBoardPicture> selectAcBoardPicture(int abp) {
		List<AcBoardPicture> acBoardPicture = sqlSessionTemplate.selectList("adminMember.acPicture", abp);
		return acBoardPicture;
	}

	public AdminFireStation selectObFireStation(int ofs) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.obFireStation", ofs);
		return station;
	}

	public AdminFireStation selectAcFireStation(int afs) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.acFireStation", afs);
		return station;
	}

	public int selectReportTotalRowNo(int fire_station_id) {
		int totalRowNum = sqlSessionTemplate.selectOne("adminMember.selectReportTotalRowNum", fire_station_id);
		return totalRowNum;
	}

	public int selectTotalRowNo(int fire_station_id, String report_handle) {
		System.out.println(fire_station_id);
		Map<String, Object> map = new HashMap<>();
		map.put("fire_station_id", fire_station_id);
		map.put("report_handle", report_handle);
		int totalRowNum = sqlSessionTemplate.selectOne("adminMember.selectTotalRowNum", map);
		return totalRowNum;
	}

	public int selectTotalPictureRowNo() {
		int TotalPictureRowNo = sqlSessionTemplate.selectOne("adminMember.selectTotalPictureRowNo");
		return TotalPictureRowNo;
	}

	public int updateHandle(int reportNo) {
		int rows = sqlSessionTemplate.update("adminMember.updateHandle", reportNo);
		return rows;
	}

	public int saveFile(int rno, String fileName) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("사진이 들어오는 곳");
		map.put("filename", fileName);
		map.put("rono", rno);
		int rows = sqlSessionTemplate.insert("adminMember.insertPic", map);
		return rows;
	}
}
