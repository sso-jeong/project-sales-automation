package com.project.saleforce.controller.emp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.CommuteSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class CommuteCtr {
	
	@Autowired
	CommuteSrv  commuSrv;
	
	@Autowired
	MainSrv mainSrv;
	
	@RequestMapping("SFA_commute_manage")
	public ModelAndView getCommuteList(@RequestParam(defaultValue = "1") int curPage, 
									@RequestParam(defaultValue = "empnm") String searchOpt, 
									@RequestParam(defaultValue = "") String words) {
		
		ModelAndView mav = new ModelAndView();
		
		int count = commuSrv.getCommuteCount(searchOpt, words);

		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();	
		
		List<CommuteManageVO> list = commuSrv.getCommuteList(start, end, searchOpt, words);
		
		mav.addObject("commuList", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); // 게시물 개수 자를 시작번호
		mav.addObject("end", end); // 게시물 자를 끝번호
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		// 페이지 번호를 클릭했을 때 css active 클래스 처리
		mav.addObject("selected", pager.getCurPage());
		
		mav.setViewName("employee/SFA_commute_manage");
		
		return mav;
	}

	@RequestMapping("getCommuteListOne")
	@ResponseBody
	public CommuteManageVO getCommuteListOne(String dlnum) {
		return commuSrv.getCommuteListOne(dlnum);
	}
	
	/*
	 * @RequestMapping(value = "setCommuteOthers", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String setCommuteOthers(CommuteManageVO commutevo) {
	 * commuSrv.setCommuteOthers(commutevo);
	 * 
	 * return "redirect:/employee/SFA_commute_manage"; }
	 */
	
	@RequestMapping(value = "updateCommuteRemark", method = RequestMethod.POST)
	@ResponseBody
	public String updateCommuteRemark(CommuteManageVO commutevo) {		
		commuSrv.updateCommuteRemark(commutevo);
		
		return "redirect:/employee/SFA_commute_manage";		
	}
	
	@RequestMapping("/commutepop")
	public ModelAndView commutepop(String dlnum) {
		ModelAndView mav = new ModelAndView();
		
		List<CommuteManageVO> list = commuSrv.commutepopup(dlnum);	
		
		mav.addObject("commutedetail", list);
		mav.setViewName("popup/commutepopup");
		return mav;
	}
	
	@RequestMapping("/setCommuteP")
	public String setCommuteP(CommuteManageVO cvo) {
		
		String date = cvo.getRegdate().substring(2, 4) + cvo.getRegdate().substring(5, 7) + cvo.getRegdate().substring(8, 10);
		String empid = cvo.getEmpid().substring(4, 10);	
		String dlnum = date + empid;
		
		cvo.setDlnum(dlnum); // 근태번호
		cvo.setDlgubun(cvo.getDlnm()); // 근태구분
		cvo.setDldate(cvo.getRegdate().substring(0, 10)); // 근태일자
		
		commuSrv.setCommuteP(cvo);
		String gubun = cvo.getDlnm();
		if(gubun.equals("C")) {
			mainSrv.updatetottime(cvo);
			mainSrv.getTotTime(cvo);
		}else cvo.setOfftime("");
		
		commuSrv.setCommuteInfoP(cvo);
		return "redirect:/SFA_commute_manage";
	}			

}
