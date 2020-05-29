package com.kh.fifteenGG.humorBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.humorBoard.model.vo.Comment;
import com.kh.fifteenGG.humorBoard.model.vo.humorBoard;

@Repository
public class humorBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> selectList(int cPage,int numPerPage){
		
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		
		return sqlSession.selectList("humorboard-mapper.selectList",null,rows);
		
		
	}
	
	public int selectTotalContents() {
		
		return sqlSession.selectOne("humorboard-mapper.selectTotalContents");
	}

	public int insertBoard(humorBoard humorboard) {
		
		return sqlSession.insert("humorboard-mapper.insertBoard",humorboard);
	}

	public humorBoard selectOne(int humorbNo) {
		
		return sqlSession.selectOne("humorboard-mapper.selectBoard",humorbNo);
	}

	public int updateBoard(humorBoard originBoard) {
		
		return sqlSession.update("humorboard-mapper.updateBoard",originBoard);
	}

	public int deleteBoard(int humorbNo) {
		
		return sqlSession.delete("humorboard-mapper.deleteBoard",humorbNo);
	}

	public int selectContent(int humorbNo) {
		
		return sqlSession.update("humorboard-mapper.selectContent",humorbNo);
	}

	public int readCount(int humorbNo) {
		
		return sqlSession.update("humorboard-mapper.readCount",humorbNo);
	}

	public int insertComment(Comment cmt) {
		// TODO Auto-generated method stub
		return sqlSession.insert("humorboard-mapper.insertComment",cmt);
	}

	public List<Comment> selectCmtList(Comment cmt) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("humorboard-mapper.selectCmtList",cmt);
	}

	public int deleteCmt(int cno) {
	      return sqlSession.delete("humorboard-mapper.deleteCmt",cno);
	   }
}
