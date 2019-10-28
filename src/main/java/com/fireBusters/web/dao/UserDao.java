package com.fireBusters.web.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insert(double lat, double lon) {
		Map<String, Double> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lat", lon);
		int row=sqlSessionTemplate.insert("user.insert", map);
		return row;	
	}

}
