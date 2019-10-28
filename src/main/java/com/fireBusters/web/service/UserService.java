package com.fireBusters.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.UserDao;
import com.fireBusters.web.dto.UserMember;


@Service
public class UserService {
	
	@Autowired
	UserDao userDao;

	public void writeLocation(double lat, double lon) {
		userDao.insert(lat, lon);
	}
	
}
