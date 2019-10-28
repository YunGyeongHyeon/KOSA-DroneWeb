package com.fireBusters.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insert(double lat, double lon) {
		int row = sqlSessionTemplate.insert("");
		
	}

}