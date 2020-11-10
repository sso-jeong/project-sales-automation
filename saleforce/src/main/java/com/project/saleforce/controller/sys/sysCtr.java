package com.project.saleforce.controller.sys;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.EmpVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.EmpSrv;

@Controller
public class sysCtr {
	
	@Autowired
	EmpSrv eSrv;
	
	@RequestMapping("SFA_auth") 
	public ModelAndView getAuth(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "empnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();	
		int count = eSrv.getEmpCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<EmpVO> list = eSrv.getEmpList(start, end, searchOpt, words);
		
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
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		//페이지 번호를 클릭했을 때 css active 클래스 처리
		mav.addObject("selected", pager.getCurPage());
		
		mav.setViewName("sys/SFA_auth");
		return mav;
	}
	
	@RequestMapping("/getOneEmp")
	@ResponseBody
	public EmpVO getOneEmp(@RequestParam String empid) {
		return eSrv.getOneEmp(empid);
	}
	
	@RequestMapping("/updateEmpAuth")
	@ResponseBody
	public EmpVO updateEmpAuth(@ModelAttribute EmpVO evo) {
		
		eSrv.updateEmpAuth(evo);
		
		return eSrv.getOneEmp(evo.getEmpid());
	}
	
	@RequestMapping("/deleteEmpAuth")
	@ResponseBody
	public String deleteEmpAuth(@RequestParam String empid) {
		String msg="";
		if(empid != "") {
			eSrv.deleteEmpAuth(empid);
			msg = "success";
		} else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("/updateAuth")
	@ResponseBody
	public String updateAuth(@RequestParam String empauth, @RequestParam String empid) {
		String msg="";
		if(empid != "") {
			eSrv.updateAuth(empauth, empid);
			msg = "success";
		} else msg = "fail";
		
		return msg;
	}
	
	
	
}
