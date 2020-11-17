package com.project.saleforce.controller.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.CompanySrv;

@Controller
public class CompanyCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping("SFA_company_manage")
	public ModelAndView getCompanyList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "comcd") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		
		int count = companySrv.getCompanyCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<CompanyVO> list = companySrv.getCompanyList(start, end, searchOpt, words);
		mav.addObject("companylist", list);
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
		
		mav.setViewName("sale/SFA_company_manage");
				
		return mav;
	}
	
	@RequestMapping("/getOneCompany")
	@ResponseBody
	public CompanyVO getOneCompany(@RequestParam String comcd){
		return companySrv.getOneCompany(comcd);
	}
	
	@RequestMapping(value = "setCompany", method = RequestMethod.POST)
	public String setCompany(@ModelAttribute CompanyVO comvo) {
		String type = comvo.getType();
		String dttype = comvo.getDttype();
		String name = comvo.getInsert_person();
		String comcd = type + dttype;
		
		comvo.setInsert_person(name);
		comvo.setComcd(comcd);
		
		companySrv.setCompany(comvo);
		
		return "redirect:/SFA_company_manage";
	}
	
	@RequestMapping("/updateCompanyInfo")
	@ResponseBody
	public String updateCompanyInfo(@ModelAttribute CompanyVO comvo){
		String msg;
		if(comvo != null) {
			companySrv.updateCompanyInfo(comvo);
			msg = "success";
		}
		else msg = "fail";
		
		
		return msg;
	}
	
	@RequestMapping("/deleteCompanyInfo")
	@ResponseBody
	public String deleteCompanyInfo(@RequestParam String comcd){
		String msg;
		if(comcd != null) {
			companySrv.deleteCompanyInfo(comcd);
			msg = "success";
		}
		else msg = "fail";
		
		
		return msg;
	}
	
	@RequestMapping("/companyDeleteAll")
	@ResponseBody
	public String itemDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr){
		
		String msg = "";
		if(chkArr != null) {		
			for(String comcd : chkArr ) {
				companySrv.deleteCompanyInfo(comcd);
			}
			
			msg="success";	
		}else msg="fail";
		
		return msg;
	}
	
	
	
	
	
}
