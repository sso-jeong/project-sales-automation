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
	
	public void setArticle(ArticleVO avo) {
		sql.insert("article.setArticle", avo);
	}
	
	public void updateArticle(ArticleVO avo) {
		sql.update("article.updateArticle", avo);
	}
	
	public ArticleVO getArticleOne(ArticleVO avo) {
		return sql.selectOne("article.getArticleOne", avo);
	}
	
	public void hitUp(ArticleVO avo) {
		sql.update("article.hitUp", avo);
	}
	
	public void setArticleDelete(int aid, String boardCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aid", aid);
		map.put("boardCode", boardCode);
		sql.delete("article.setArticleDelete", map);
	}
	
	public ArticleVO getArticleReplyInfo(ArticleVO avo) throws Exception {
		return sql.selectOne("article.getArticleReplyInfo", avo);
	}
	
	public int setArticleRef(ArticleVO avo) throws Exception {

		return sql.update("article.setArticleRef", avo);
	}
	
	public int setArticleReply(ArticleVO avo) throws Exception {
		return sql.insert("article.setArticleReply", avo);
	}
}
