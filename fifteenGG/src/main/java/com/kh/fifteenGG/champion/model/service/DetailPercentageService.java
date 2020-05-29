package com.kh.fifteenGG.champion.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.champion.model.dao.DetailPercentageDAO;
import com.kh.fifteenGG.champion.model.vo.ChampionRunRC;
import com.kh.fifteenGG.champion.model.vo.ChampionSpellRC;


@Service
public class DetailPercentageService {

	@Autowired
	DetailPercentageDAO detailpercentageDAO;

	public List<ChampionSpellRC> spellPercentageList(String name) {
		
		return detailpercentageDAO.spellPercentageList(name);
	}

	public List<ChampionRunRC> runRcList(String name) {
		
		 return detailpercentageDAO.runRcList(name);
	}

	public List<Object> itemList(String name) {
		
		return detailpercentageDAO.itemList(name);
	}
	


	public List<Object> shoesList(String name) {
		
		return detailpercentageDAO.shoesList(name);
	}
	
	public List<Object> startList(String name) {
		
		return detailpercentageDAO.startList(name);
	}
	
	
	public List<Object> champChart(String name) {
	     
		return detailpercentageDAO.champChart(name);
	   }

	public List<Object> benPerChart(String name) {
      
		return detailpercentageDAO.benPerChart(name);
   }




	

	

}
