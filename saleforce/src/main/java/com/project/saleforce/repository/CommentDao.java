package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CommentVO;

@Repository
public class CommentDao {

	@Autowired
	SqlSession sql;
	
	public void setComment(CommentVO cvo) {
		sql.insert("comment.setComment", cvo);
	}
	
	//게시판 코드(boardCode), 게시물 번호(aid)
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return sql.selectList("comment.getCommentList", cvo);
	}
	
	public int getCommentCount(CommentVO cvo) {
		return sql.selectOne("comment.getCommentCount", cvo);
	}
	
	public void setCommentDelete(CommentVO cvo) {
		sql.delete("comment.setCommentDelete", cvo);
	}
	
	public void setCommentModify(CommentVO cvo) {
		sql.update("comment.setCommentModify", cvo);
	}
}
