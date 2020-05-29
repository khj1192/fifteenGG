package com.kh.fifteenGG.champion.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.champion.model.vo.ChampionRunRC;
import com.kh.fifteenGG.champion.model.vo.ChampionSpellRC;

@Repository
public class DetailPercentageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ChampionSpellRC> spellPercentageList(String name) {
		
		return sqlSession.selectList("detailpercentage-mapper.spellPercentageList", name) ;
	}

	public List<ChampionRunRC> runRcList(String name) {
		
		return sqlSession.selectList("detailpercentage-mapper.runRcList" , name);
	}

	public List<Object> itemList(String name) {
		
		return sqlSession.selectList("detailpercentage-mapper.itemList", name);
	}
	
	public List<Object> startList(String name) {
		
		return sqlSession.selectList("detailpercentage-mapper.startList",name);
	}

	public List<Object> shoesList(String name) {
		
		return sqlSession.selectList("detailpercentage-mapper.shoesList", name);
	}
	
	public List<Object> champChart(String name) {
	      
		return sqlSession.selectList("detailpercentage-mapper.champChart" , name);
	   }

	public List<Object> benPerChart(String name) {
	      
		return sqlSession.selectList("detailpercentage-mapper.benPerChart", name);
	   }

	

	

}


