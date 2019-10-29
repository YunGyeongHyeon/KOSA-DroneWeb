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

	public int insert(double lat, double lon, int fire_station_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lon", lon);
		map.put("fire_station_id", fire_station_id);
		int rows = sqlSessionTemplate.insert("user.insert", map);
		return rows;
	}

}