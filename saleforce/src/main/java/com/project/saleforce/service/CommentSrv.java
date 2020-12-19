package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CommentVO;
import com.project.saleforce.repository.CommentDao;

@Service
public class CommentSrv {

	@Autowired
	CommentDao cDao;
	
	public void setComment(CommentVO cvo) {
		cDao.setComment(cvo);
	}
	
	//게시판 코드(boardCode), 게시물 번호(aid)
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return cDao.getCommentList(cvo);
	}
	
	public int getCommentCount(CommentVO cvo) {
		return cDao.getCommentCount(cvo);
	}
	
	public void setCommentDelete(CommentVO cvo) {
		cDao.setCommentDelete(cvo);
	}
	
	public void setCommentModify(CommentVO cvo) {
		cDao.setCommentModify(cvo);
	}
}
