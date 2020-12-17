package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.BoardVO;

@Repository
public class BoardDao {
	@Autowired 
	SqlSession sql;
	
	public List<BoardVO> getBoard(int start, int end, String searchOpt, String words){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		
		return sql.selectList("board.getBoard", map);
	}
	
	public int getCount(String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne("board.getCount", map);
	}
	
	public int getBoardCheck(String boardCode) {
		return sql.selectOne("board.getBoardExist", boardCode);
	}
	
	public void setBoard(BoardVO bvo) {
		sql.insert("board.setBoard", bvo);
	}
	
	public void createArticle(String boardCode) {
		String str = "CREATE TABLE article_" + boardCode;
		str += "(aid int not null auto_increment primary key,";
		str += "division char(1),";
		str += "subject varchar(300) not null,";
		str += "writer varchar(20) not null,";
		str += "content text,";
		str += "regdate datetime,";
		str += "hit int default 0,";
		str += "fileName varchar(300),";
		str += "fileOriName varchar(300),";
		str += "fileUrl varchar(500),";
		str += "ref int,";
		str += "re_step int,";
		str += "re_level int);";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sql.update("board.createArticleTbl", map);
	}
	
	public void createComment(String boardCode) {
		String str = "CREATE TABLE comment_" + boardCode;
		str += "(cid int not null auto_increment primary key,";
		str += "aid int not null,";
		str += "comment text,";
		str += "who varchar(20),";
		str += "regdate datetime);";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sql.update("board.createCommentTbl", map);
	}
	
	public void setBoardDelete(String boardCode) {
		sql.delete("board.setBoardDelete", boardCode);
	}
	
	public void dropArticle(String boardCode) {
		String str = "drop TABLE article_" + boardCode;
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sql.insert("board.dropArticleTbl", map);
	}

	public void dropComment(String boardCode) {
		String str = "drop TABLE comment_" + boardCode;
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sql.insert("board.dropCommentTbl", map);
	}
	
	public BoardVO getBoardInfo(String boardCode) {
		return sql.selectOne("board.getBoardInfo", boardCode);
	}
 
	public void updateBoard(BoardVO bvo) {
		sql.update("board.updateBoard", bvo);
	}
}
