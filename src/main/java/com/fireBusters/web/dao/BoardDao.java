package com.fireBusters.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;

@Component
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ObBoard> selectList(int obid) {
		List<ObBoard> obBoardList = sqlSessionTemplate.selectList("board.obSelectList", obid);
		return obBoardList;
	}

	public AdminFireStation selectObFireStation(int ofs) {
		AdminFireStation station = sqlSessionTemplate.selectOne("board.obFireStation", ofs);
		return station;
	}


	public List<ObBoardPicture> selectObBoardPicture(int obp) {
		obp=3;
		System.out.println("dsjfasdlfjaslf"+obp);
		List<ObBoardPicture> obBoardPicture = sqlSessionTemplate.selectList("board.obPicture", obp);
		return obBoardPicture;
	}

}
