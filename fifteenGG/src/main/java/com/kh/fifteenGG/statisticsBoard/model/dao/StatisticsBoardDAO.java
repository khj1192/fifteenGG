package com.kh.fifteenGG.statisticsBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.statisticsBoard.model.vo.DataTablePackageBoard;
import com.kh.fifteenGG.statisticsBoard.model.vo.ObjectPercentage;

@Repository
public class StatisticsBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<ObjectPercentage> objectWinPercentage(ObjectPercentage objectPercentage) {
		return sqlSession.selectList("statistics-mapper.objectWinPercentage", objectPercentage);
	}

	
	public List<DataTablePackageBoard> dataTablePackage(DataTablePackageBoard dataTablePackageBoard) {
		return sqlSession.selectList("statistics-mapper.dataTablePackage", dataTablePackageBoard);
	}
	
	
	
	

}
