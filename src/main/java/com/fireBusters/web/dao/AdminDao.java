package com.fireBusters.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.AdminMember;
import com.fireBusters.web.dto.testMember;
@Component
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminMember selectAdmin(int fire_station_id) {
		AdminMember member = sqlSessionTemplate.selectOne("adminMember.selectAdminMember", fire_station_id);// member는 매퍼 member.xml에 있다.
		return member;
	}

	public List<AdminBoard> selectReport(int id) {
		List<AdminBoard> board = sqlSessionTemplate.selectList("adminMember.selectReport",id);
		return board;
	}
	
	public testMember selectTest(int fire_station_id){
		
		testMember test = sqlSessionTemplate.selectOne("area.fire_station_area", fire_station_id);
		return test;
	}

	public AdminFireStation selectFireStation(int fire_station_id) {
		AdminFireStation station = sqlSessionTemplate.selectOne("adminMember.selectFireStation", fire_station_id);
		return station;
	}

}
