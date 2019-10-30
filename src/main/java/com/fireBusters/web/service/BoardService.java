package com.fireBusters.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.BoardDao;
import com.fireBusters.web.dto.AdminFireStation;
import com.fireBusters.web.dto.ObBoard;
import com.fireBusters.web.dto.ObBoardPicture;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	
	public List<ObBoard> selectObBoardList(int obid) {
		List<ObBoard> obBoardList = boardDao.selectList(obid);
		return obBoardList;

	}

	public AdminFireStation selectObFireStation(int ofs) {
		AdminFireStation station = boardDao.selectObFireStation(ofs);
		return station;
	}

	public List<ObBoardPicture> selectObBoardPicture(int obp) {
		List<ObBoardPicture> obBoardPicture = boardDao.selectObBoardPicture(obp);
		
		return obBoardPicture;
	}

}
