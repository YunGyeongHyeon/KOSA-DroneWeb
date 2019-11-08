package com.fireBusters.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminLatLon;
import com.fireBusters.web.dto.AdminMember;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;
@Component
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminMember selectAdmin(int fire_station_id) {
		AdminMember member = sqlSessionTemplate.selectOne("adminMember.selectAdminMember", fire_station_id);
		return member;
	}

	public List<AdminBoard> selectReport(int id, int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("id", id);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<AdminBoard> board = sqlSessionTemplate.selectList("adminMember.selectReport",map);
		return board;
	}

	public AdminFireStation selectFireStation(int fire_station_id) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.selectFireStation", fire_station_id);
		return station;
	}

	public List<AdminLatLon> selectPoint() {
		List<AdminLatLon> aLatLon = sqlSessionTemplate.selectList("adminMember.selectPoint");
		
		return aLatLon;
	}
	
	public List<ObBoard> selectList(int obid,  int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("obid", obid);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<ObBoard> obBoardList = sqlSessionTemplate.selectList("adminMember.obSelectList", map);
		return obBoardList;
	}

	public AdminFireStation selectObFireStation(int ofs) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.obFireStation", ofs);
		return station;
	}
	
	public List<ObBoardPicture> selectObBoardPicture(int obp) {
		obp=3;
		System.out.println("dsjfasdlfjaslf"+obp);
		List<ObBoardPicture> obBoardPicture = sqlSessionTemplate.selectList("adminMember.obPicture", obp);
		return obBoardPicture;
	}

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("adminMember.selectTotalRowNum");
		return totalRowNum;
	}

	public int selectTotalPictureRowNo() {
		int TotalPictureRowNo = sqlSessionTemplate.selectOne("adminMember.selectTotalPictureRowNo");
		return TotalPictureRowNo;
	}

}
