package com.kh.fifteenGG.partyBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.partyBoard.model.dao.PartyBoardDAO;
import com.kh.fifteenGG.partyBoard.model.vo.PartyBoard;

@Service
public class PartyBoardService {

	@Autowired
	PartyBoardDAO partyBoardDAO;
	
	public int insertParty(PartyBoard partyBoard) {
		return partyBoardDAO.insertParty(partyBoard);
	}

	public List<PartyBoard> partyBoardList(PartyBoard partyBoard) {
		return partyBoardDAO.partyBoardList(partyBoard);
	}
	
	
	public List<PartyBoard> indexPartyBoardList(PartyBoard partyBoard) {
		return partyBoardDAO.indexPartyBoardList(partyBoard);
	}

	public int totalCountContent() {
		return partyBoardDAO.totalCountContent();
	}

	public List<PartyBoard> searchList(PartyBoard partyBoard) {	
		return partyBoardDAO.searchList(partyBoard);
	}


	public PartyBoard SelectRcParty(String tierInfo) {
		return partyBoardDAO.SelectRcParty(tierInfo);
	}
}
