package com.kh.fifteenGG.humorBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.humorBoard.model.dao.humorBoardDAO;
import com.kh.fifteenGG.humorBoard.model.vo.Comment;
import com.kh.fifteenGG.humorBoard.model.vo.humorBoard;



@Service
public class humorBoardService {
	
		@Autowired
		humorBoardDAO humorBoardDAO;
		
		public List<Map<String, String>> selectList(int cPage, int numPerPage){
			
			return humorBoardDAO.selectList(cPage, numPerPage);
		}

		public int selectTotalContents() {
			
			return humorBoardDAO.selectTotalContents();
		}
		public int insertBoard(humorBoard humorboard) { 
					
			// 1. 게시글 추가			
			return humorBoardDAO.insertBoard(humorboard);
		
		}
		public humorBoard selectOne(int humorbNo) {
			return humorBoardDAO.selectOne(humorbNo);
		}

		public int updateBoard(humorBoard originBoard) {
			int result = 0;
			
			result = humorBoardDAO.updateBoard(originBoard);
			
			return result;
		}
		
		public int deleteBoard(int humorbNo) {
			return humorBoardDAO.deleteBoard(humorbNo);
		}
		
		
		public int selectContent(int humorbNo) {
			return humorBoardDAO.selectContent(humorbNo);
		}

		public int readCount(int humorbNo) {
			return humorBoardDAO.readCount(humorbNo);
		}
		// 댓글 등록
				public int insertComment(Comment cmt) { 
					return humorBoardDAO.insertComment(cmt);
				
				}
				// 댓글 리스트
				public List<Comment> selectCmtList(Comment cmt) {
					return humorBoardDAO.selectCmtList(cmt);
				}

				public int deleteCmt(int cno) {
		               return humorBoardDAO.deleteCmt(cno);
		            }
				
		}

