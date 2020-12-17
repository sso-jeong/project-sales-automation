package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.BoardVO;
import com.project.saleforce.repository.BoardDao;

@Service
public class BoardSrv {

	@Autowired
	BoardDao boardDao;
	
	public List<BoardVO> getBoard(int start, int end, String searchOpt, String words){
		return boardDao.getBoard(start, end, searchOpt, words);
	}
	
	public int getCount(String searchOpt, String words) {
		return boardDao.getCount(searchOpt, words);
	}
	
	public void setBoard(BoardVO bvo) {
		boardDao.setBoard(bvo);
	}
	
	public int getBoardCheck(String boardCode) {
		return boardDao.getBoardCheck(boardCode);
	}
	
	public void createArticle(String boardCode) {
		boardDao.createArticle(boardCode);
	}
	
	public void createComment(String boardCode) {
		boardDao.createComment(boardCode);
	}
	
	public void setBoardDelete(String boardCode) {
		boardDao.setBoardDelete(boardCode);
	}
	
	public void dropArticle(String boardCode) {
		boardDao.dropArticle(boardCode);
	}
	
	public void dropComment(String boardCode) {
		boardDao.dropComment(boardCode);
	}
	
	public BoardVO getBoardInfo(String boardCode) {
		return boardDao.getBoardInfo(boardCode);
	}
	
	public void updateBoard(BoardVO bvo) {
		boardDao.updateBoard(bvo);
	}
}
