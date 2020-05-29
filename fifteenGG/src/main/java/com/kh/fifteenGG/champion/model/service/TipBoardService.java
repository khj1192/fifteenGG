package com.kh.fifteenGG.champion.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.champion.model.dao.TipBaordDAO;
import com.kh.fifteenGG.champion.model.vo.TipBoard;



@Service
public class TipBoardService {

	@Autowired
	TipBaordDAO tipBoardDAO;

	public int insertTipBoard(TipBoard tipBoard) {
		
		return tipBoardDAO.insertTipBoard(tipBoard);
	}

	public List<Map<String, String>> selectList(String championName, int cPage, int numPerPage) {
		return tipBoardDAO.selectList(championName, cPage, numPerPage);
	}

	public int selectTotalContents(String championName) {
		return tipBoardDAO.selectTotalContents(championName);
	}

	public List<TipBoard> selectMainList(String name) {
		
		return tipBoardDAO.selectMainList(name);
	}

	public int selectTotalMainContents(String championName) {
		
		return tipBoardDAO.selectTotalMainContents(championName);
	}

	public TipBoard selectOne(int tipBno) {
		
		return tipBoardDAO.selectOne(tipBno);
	}

	public int deleteTipBoard(int tipBno) {
		
		return tipBoardDAO.deleteTipBoard(tipBno);
	}

	public int readCount(int tipBno) {
		
		return tipBoardDAO.readCount(tipBno);
	}
	
	
}
