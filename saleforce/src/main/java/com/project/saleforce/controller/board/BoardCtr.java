package com.project.saleforce.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.BoardVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.BoardSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class BoardCtr {

	@Autowired
	BoardSrv bSrv;
	
	@Autowired
	MainSrv mSrv;
 
	@RequestMapping("SFA_notice_manage")
	public ModelAndView getStockList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "ntgrpnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = bSrv.getCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = bSrv.getBoard(start, end, searchOpt, words);
		
		mav.addObject("com", mSrv.getCompanyInfo());
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
	public String setBoard(@ModelAttribute BoardVO bvo) {
		if (bvo.getBoardCode() != "") {
			bSrv.setBoard(bvo);
			bSrv.createArticle(bvo.getBoardCode());
			bSrv.createComment(bvo.getBoardCode());
		}

		return "redirect:/SFA_notice_manage";
	}
	
	@RequestMapping("/deleteBoard")
	@ResponseBody
	public String setBoardDelete(@RequestParam String boardCode) {
		String msg="";
		if(boardCode.equals("")) {
			msg = "fail";
		}else {
			bSrv.setBoardDelete(boardCode);
			bSrv.dropArticle(boardCode);
			bSrv.dropComment(boardCode);
			msg = "success";
		}

		return msg;
	}
	
	@RequestMapping("/deleteBoardAll")
	@ResponseBody
	public String setBoardDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr) {
		
		for (String boardCode : chkArr) {
			bSrv.setBoardDelete(boardCode);
			bSrv.dropArticle(boardCode);
			bSrv.dropComment(boardCode);
		}

		return "success";
	}
	
	@RequestMapping(value = "boardCheck")
	@ResponseBody
	public String idCheck(@RequestParam String boardCode) {
		int result = bSrv.getBoardCheck(boardCode);
		String msg;
		if (result > 0)
			msg = "fail";
		else
			msg = "success";
		return msg;
	}
	
	@RequestMapping("/getBoardInfo")
	@ResponseBody
	public BoardVO getBoardInfo(@RequestParam String boardCode) {
		return bSrv.getBoardInfo(boardCode);
	}
	
	@RequestMapping("/updateBoard")
	@ResponseBody
	public String updateBoard(@ModelAttribute BoardVO bvo) {
		String msg = "";
		
		if(bvo != null) {
			System.out.println(bvo.getBoardCode());
			bSrv.updateBoard(bvo);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}

}
