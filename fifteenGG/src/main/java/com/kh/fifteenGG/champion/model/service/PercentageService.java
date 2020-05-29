package com.kh.fifteenGG.champion.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.champion.model.dao.PercentageDAO;
import com.kh.fifteenGG.champion.model.vo.Percentage;


@Service
public class PercentageService {

	@Autowired
	PercentageDAO percentageDAO;
	
	
	public List<Percentage> winPercentTopFive() {
		return percentageDAO.winPercentTopFive();
	}


	public List<Percentage> winPercentTopTen() {
		return percentageDAO.winPercentTopTen();
	}


	public List<Percentage> winPercentJungleFive() {
		return percentageDAO.winPercentJungleFive();
	}


	public List<Percentage> winPercentJungleTen() {
		return percentageDAO.winPercentJungleTen();
	}


	public List<Percentage> winPercentMidFive() {
		return percentageDAO.winPercentMidFive();
	}


	public List<Percentage> winPercentMidTen() {
		return percentageDAO.winPercentMidTen();
	}


	public List<Percentage> winPercentAdcFive() {
		return percentageDAO.winPercentAdcFive();
	}


	public List<Percentage> winPercentAdcTen() {
		return percentageDAO.winPercentAdcTen();
	}


	public List<Percentage> winPercentSupportFive() {
		return percentageDAO.winPercentSupportFive();
	}


	public List<Percentage> winPercentSupportTen() {
		return percentageDAO.winPercentSupportTen();
	}
	
public List<Percentage> supportAll() {
		
		return percentageDAO.supportAll();
	}


	public List<Percentage> adcAll() {
		// TODO Auto-generated method stub
		return percentageDAO.adcAll();
	
	

	}
	public List<Percentage> topAll() {
		// TODO Auto-generated method stub
		return percentageDAO.topAll();
	
	

	}
	public List<Percentage> midAll() {
		// TODO Auto-generated method stub
		return percentageDAO.midAll();
	
	

	}
	public List<Percentage> jungleAll() {
		// TODO Auto-generated method stub
		return percentageDAO.jungleAll();
	
	

	}


	public List<Percentage> champAll() {
		// TODO Auto-generated method stub
		return percentageDAO.champAll();
	}

}
