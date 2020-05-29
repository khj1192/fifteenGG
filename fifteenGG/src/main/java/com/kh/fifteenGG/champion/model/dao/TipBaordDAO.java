package com.kh.fifteenGG.champion.model.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.champion.model.vo.TipBoard;
import com.kh.fifteenGG.champion.controller.*;

@Repository
public class TipBaordDAO {

	
		@Autowired
		SqlSessionTemplate sqlSession;

		public int insertTipBoard(TipBoard tipBoard) {
			
			return sqlSession.insert("tipBoard-mapper.insertTipBoard", tipBoard );
		}

		public List<Map<String, String>> selectList(String championName, int cPage, int numPerPage) {
			RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
			//                                                 null자리 : 파라미터로 받을 값 ,
			//                                                 rows자리 : RowBounds 전용 공간
			return sqlSession.selectList("tipBoard-mapper.selectList", championName, rows);
		}

		public int selectTotalContents(String championName) {
			return sqlSession.selectOne("tipBoard-mapper.selectTotalContents", championName);
		}

		public List<TipBoard> selectMainList(String name) {
			
			return sqlSession.selectList("tipBoard-mapper.selectMainList" ,name);
		}

		public int selectTotalMainContents(String championName) {
			
			return sqlSession.selectOne("tipBoard-mapper.selectTotalMainContents", championName);
		}

		public TipBoard selectOne(int tipBno) {
			
			return sqlSession.selectOne("tipBoard-mapper.selectTipBoardView", tipBno);
		}

		public int deleteTipBoard(int tipBno) {
			
			return sqlSession.delete("tipBoard-mapper.deleteTipBoard", tipBno);
		}

		public int readCount(int tipBno) {
			
			return sqlSession.update("tipBoard-mapper.readCount", tipBno);
		}

		


}
