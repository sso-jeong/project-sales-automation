package com.project.saleforce.controller.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.model.ItemVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.CompanySrv;

@Controller
public class CompanyCtr {

	@Autowired
	CompanySrv comSrv;

	@RequestMapping("SFA_company_manage")
	public ModelAndView getComList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "comcd") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();	
		
		int count = comSrv.getComCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);
			
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<CompanyVO> list = comSrv.getComList(start, end, searchOpt, words);
		
		mav.addObject("comlist", list);
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
		
		mav.setViewName("sale/SFA_item_manage");
		return mav;
	}
	
	
	
}
