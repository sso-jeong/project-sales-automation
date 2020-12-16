package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

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
	
	public void setBoard(BoardVO bvo) {
		sql.insert("board.setBoard", bvo);
	}
 
}
