package com.project.saleforce.controller.emp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.EmpVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.EmpSrv;
import com.project.saleforce.service.ManageSrv;

@Controller
public class EmpCtr {
	@Autowired
	EmpSrv eSrv;
	
	@Autowired
	ManageSrv mSrv;

	// ################################# 사원목록 소스 시작   #################################	
	
	@RequestMapping("SFA_empList")
	public ModelAndView getEmpList(@RequestParam(defaultValue = "1") int curPage, 
									@RequestParam(defaultValue = "empnm") String searchOpt, 
									@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		
		int count = mSrv.getAuthCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();	
		
		List<EmpVO> list = eSrv.getEmpList(start, end, searchOpt, words);
		
		mav.addObject("list", list);
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
		
		//System.out.println(searchOpt);
		//System.out.println(words);
		
		mav.setViewName("employee/SFA_empList");
		
		return mav;
	}
	
	@RequestMapping("SFA_empOne")
	@ResponseBody
	public EmpVO getEmpListOne(@RequestParam String empID) {
		return eSrv.getEmpListOne(empID);
	}
	
	@RequestMapping(value = "SFA_setEmpOthers", method = RequestMethod.POST)
	@ResponseBody
	public String setEmpOthers(@ModelAttribute EmpVO empvo) {
		//System.out.println(empvo.getEmpid());
		
		eSrv.setEmpOthers(empvo);
		return "employee/SFA_empList";

	}
	

}
