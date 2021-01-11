package com.project.saleforce.controller.manage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.project.saleforce.model.EmpVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.MainSrv;
import com.project.saleforce.service.ManageSrv;

@Controller
public class AuthCtr {
	
	@Autowired
	ManageSrv mSrv;
	
	@Autowired
	MainSrv mainSrv;
	
	@RequestMapping("SFA_auth")
	public ModelAndView getAuth(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "empnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		
		int count = mSrv.getAuthCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin(); // 0 ~ 10 -> 11 ~ 20 -> 21 ~ 30
		int end = pager.getPageEnd();	
		
		List<EmpVO> list = mSrv.getAuthList(start, end, searchOpt, words);
		
		mav.addObject("com", mainSrv.getCompanyInfo());
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); // �Խù� ���� �ڸ� ���۹�ȣ
		mav.addObject("end", end); // �Խù� �ڸ� ����ȣ
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		// ������ ��ȣ�� Ŭ������ �� css active Ŭ���� ó��
		mav.addObject("selected", pager.getCurPage());
		
		mav.setViewName("manage/SFA_auth");
		
		return mav;
	}
	
	@RequestMapping("getOneEmp")
	@ResponseBody
	public EmpVO getAuthListOne(@RequestParam String empID) {
		return mSrv.getAuthListOne(empID);
	}
	
	@RequestMapping(value = "/updateEmpAuth", method = RequestMethod.POST)
	@ResponseBody
	public String setAuthChange(EmpVO evo) {
		//System.out.println(evo.getEmpid());
		mSrv.setAuthChange(evo);
		return "manage/SFA_auth";
	}
	
	@RequestMapping(value="/confirmChange",  method = RequestMethod.POST)
	@ResponseBody
	public String setConfirmChange(@RequestParam String empAuth, @RequestParam String empID) {
		mSrv.setConfirmChange(empAuth, empID);
		return "success";
	}
	
	@RequestMapping(value="/deleteEmpAuth", method = RequestMethod.POST)
	@ResponseBody
	public String setAuthDel(String empid) {
		mSrv.setAuthDel(empid);
		return "success";
	}

}
