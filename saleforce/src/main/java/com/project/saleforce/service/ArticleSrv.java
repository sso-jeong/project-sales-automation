package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;
import com.project.saleforce.repository.ArticleDao;

@Service
public class ArticleSrv {

	@Autowired
	ArticleDao artDao;
	
	public List<ArticleVO> getArticleList(int start, int end, String searchOpt, String words, String boardCode){
		return artDao.getArticleList(start, end, searchOpt, words, boardCode);
	}
	
	public int getArticleCount(String searchOpt, String words, String boardCode) {
		return artDao.getArticleCount(searchOpt, words, boardCode);
	}
	
	public BoardVO getBoardOne(String boardCode) {
		return artDao.getBoardOne(boardCode);
	}
	
	public void setArticle(ArticleVO avo) {
		artDao.setArticle(avo);
	}
	
	public void updateArticle(ArticleVO avo) {
		artDao.updateArticle(avo);
	}
	
	public ArticleVO getArticleOne(ArticleVO avo) {
		return artDao.getArticleOne(avo);
	}
	
	public void hitUp(ArticleVO avo) {
		artDao.hitUp(avo);
	}
	
	public void setArticleDelete(int aid, String boardCode) {
		artDao.setArticleDelete(aid, boardCode);
	}
	
}
