package com.kh.fifteenGG.statisticsBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.statisticsBoard.model.dao.StatisticsBoardDAO;
import com.kh.fifteenGG.statisticsBoard.model.vo.DataTablePackageBoard;
import com.kh.fifteenGG.statisticsBoard.model.vo.ObjectPercentage;

@Service
public class StatisticsBoardService {
	
	@Autowired
	StatisticsBoardDAO statisticsBoardDAO;
	

	public List<ObjectPercentage> objectWinPercentage(ObjectPercentage objectPercentage) {
		
		return statisticsBoardDAO.objectWinPercentage(objectPercentage);
	}


	public List<DataTablePackageBoard> dataTablePackage(DataTablePackageBoard dataTablePackageBoard) {
		// TODO Auto-generated method stub
		return statisticsBoardDAO.dataTablePackage(dataTablePackageBoard);
	}

	
}
