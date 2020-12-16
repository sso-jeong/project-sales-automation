package com.project.saleforce.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.BoardVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.BoardSrv;

@Controller
public class BoardCtr {

	@Autowired
	BoardSrv bSrv;

	@RequestMapping("SFA_notice_manage")
	public ModelAndView getStockList(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "ntgrpnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = bSrv.getCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = bSrv.getBoard(start, end, searchOpt, words);
		mav.addObject("boardlist", list);
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
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());

		mav.addObject("selected", pager.getCurPage());

		mav.setViewName("notice/SFA_notice_manage");
		return mav;

	}

	@RequestMapping("/setBoard")
	public String setBoard(BoardVO bvo) {
		if (bvo.getBoardCode() != "") {
			bSrv.setBoard(bvo);
		}

		return "redirect:/SFA_notice_manage";
	}

}
