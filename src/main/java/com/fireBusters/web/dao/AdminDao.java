package com.fireBusters.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fireBusters.web.dto.AdminBoard;
import com.fireBusters.web.dto.AdminMember;
@Component
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminMember selectAdmin(String adminId) {
		AdminMember member = sqlSessionTemplate.selectOne("adminMember.selectAdminMember", adminId);// member는 매퍼 member.xml에 있다.
		return member;
	}

	public List<AdminBoard> selectReport(String name) {
		System.out.println(name+"-------------------------------------------------------------");
		List<AdminBoard> board = sqlSessionTemplate.selectList("adminMember.selectReport",name);
		return board;
	}

}
