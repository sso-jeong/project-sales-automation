package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;

@Repository
public class ArticleDao {

	@Autowired
	SqlSession sql;
	
	public List<ArticleVO> getArticleList(int start, int end, String searchOpt, String words, String boardCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("boardCode", boardCode);
		return  sql.selectList("article.getArticleList", map);
	}
	
	public int getArticleCount(String searchOpt, String words, String boardCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("boardCode", boardCode);
		return sql.selectOne("article.getArticleCount", map);
	}
	
	public BoardVO getBoardOne(String boardCode) {
		return sql.selectOne("article.getBoardOne", boardCode);
	}
}
