package com.project.saleforce.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.ArticleSrv;

@Controller
public class ArticelCtr {
	
	@Autowired
	ArticleSrv artSrv;
	
	@RequestMapping("SFA_notice_list")
	public ModelAndView getArticleList(@RequestParam(defaultValue = "1") int curPage,@RequestParam(defaultValue = "subject") String searchOpt, @RequestParam(defaultValue = "") String words,  @RequestParam String boardCode) {
		int count = artSrv.getArticleCount(searchOpt, words, boardCode);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		BoardVO bvo = artSrv.getBoardOne(boardCode);
		List<ArticleVO> list = artSrv.getArticleList(start, end, searchOpt, words, boardCode);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("totalPage", pager.getTotPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("selected", pager.getCurPage());
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		
		mav.setViewName("notice/SFA_notice_list");
		return mav;
	}
}
