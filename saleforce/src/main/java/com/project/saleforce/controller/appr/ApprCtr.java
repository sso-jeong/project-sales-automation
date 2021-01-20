package com.project.saleforce.controller.appr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ApproveVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.ApproveSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class ApprCtr {
	
	@Autowired
	ApproveSrv aSrv;
	
	@Autowired
	MainSrv mSrv;
	
	@RequestMapping("SFA_approve_ready")
	public ModelAndView getApprReady(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "docnm") String searchOpt, @RequestParam(defaultValue = "") String words, @RequestParam(defaultValue = "0") int apprst, @RequestParam String empnm) {
		ModelAndView mav = new ModelAndView();
		
		int count = aSrv.getApprCnt(searchOpt, words, apprst, empnm);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
			
		List<ApproveVO> list = aSrv.getApprove(start, end, searchOpt, words, apprst, empnm);
		
		mav.addObject("apprst", apprst);
		mav.addObject("com", mSrv.getCompanyInfo());
		mav.addObject("apprlist", list);
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
		mav.setViewName("approve/SFA_approve_ready");
		
		return mav;
	}
	
	@RequestMapping("b_log")
	public ModelAndView blog1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../file/b_log");		
		return mav;
	}
	
	@RequestMapping("day_off")
	public ModelAndView dayoff1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../file/day_off");		
		return mav;
	}
	
	@RequestMapping("b_logview")
	public ModelAndView blog(String docnum) {
		ModelAndView mav = new ModelAndView();
		if(docnum != null) {
			ApproveVO avo = aSrv.getOneAppr(docnum);
			mav.addObject("yeon", avo);
		}
		mav.setViewName("../file/b_logview");
		
		return mav;
	}
	
	@RequestMapping("day_offview")
	public ModelAndView dayoff(String docnum) {
		ModelAndView mav = new ModelAndView();
		if(docnum != null) {
			ApproveVO avo = aSrv.getOneAppr(docnum);
			mav.addObject("yeon", avo);
		}
		mav.setViewName("../file/day_offview");
		
		return mav;
	}
	
	
	@RequestMapping("setApprove")
	public String setApprove(@ModelAttribute ApproveVO avo) {
		String date = avo.getRegdate().substring(0,4) + avo.getRegdate().substring(5,7) + avo.getRegdate().substring(8,10);
		String docnum = date;
		avo.setChk1("on");
		avo.setDocnum(docnum);
		
		aSrv.setApprove(avo);
		
		return "redirect:/b_log";
	}
	
	@RequestMapping("upApprove")
	public String upApprove(@ModelAttribute ApproveVO avo, String empnm) {
		String lv3 = avo.getEmpnm3();
		
		if(lv3.equals(empnm)) {
			avo.setApprst(1);
		}
		
		aSrv.upApprove(avo);
		
		return "redirect:/b_log";
	}	
	
	@RequestMapping("allAppr")
	@ResponseBody
	public String allAppr(@RequestParam(value = "chkArr[]") List<String> chkArr, @RequestParam String empid){
		
		String msg = "";
		if(chkArr != null) {
			
			for(String docnum : chkArr) { 
				ApproveVO avo = aSrv.getOneAppr(docnum);
				if(!(avo.getEmpid().equals(empid))) {
					return msg="neemp";				
				}
			}
			
			for(String docnum : chkArr) { 				
				aSrv.delApprove(docnum);
			}	
				return msg="success";
				
		}else return msg="fail";		
	}
}
