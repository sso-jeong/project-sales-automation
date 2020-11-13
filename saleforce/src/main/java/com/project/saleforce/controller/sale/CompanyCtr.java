package com.project.saleforce.controller.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.service.CompanySrv;

@Controller
public class CompanyCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping("SFA_company_manage")
	public ModelAndView getCompanyList() {
		ModelAndView mav = new ModelAndView();
		
		List<CompanyVO> list = companySrv.getCompanyList();
		mav.addObject("companylist", list);
		mav.setViewName("sale/SFA_company_manage");
				
		return mav;
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
	
	
}
