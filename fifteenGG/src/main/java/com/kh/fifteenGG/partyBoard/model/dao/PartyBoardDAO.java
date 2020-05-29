package com.kh.fifteenGG.partyBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.partyBoard.model.vo.PartyBoard;

@Repository
public class PartyBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertParty(PartyBoard partyBoard) {
		return sqlSession.insert("partyBoard-mapper.insertParty", partyBoard);
	}

	
	public List<PartyBoard> partyBoardList(PartyBoard partyBoard) { 
		return sqlSession.selectList("partyBoard-mapper.selectListParty", partyBoard); 
		}
	
	
	public List<PartyBoard> indexPartyBoardList(PartyBoard partyBoard) { 
		return sqlSession.selectList("partyBoard-mapper.indexPartyBoardList", partyBoard); 
	}
	 

	public int totalCountContent() {
		return sqlSession.selectOne("partyBoard-mapper.totalCountContent");
	}


	public List<PartyBoard> searchList(PartyBoard partyBoard) {
		return sqlSession.selectList("partyBoard-mapper.searchList", partyBoard);
	}


    public PartyBoard SelectRcParty(String tierInfo) {
		System.out.println("dao옴");
		return sqlSession.selectOne("partyBoard-mapper.SelectRcParty", tierInfo);
    }

}
