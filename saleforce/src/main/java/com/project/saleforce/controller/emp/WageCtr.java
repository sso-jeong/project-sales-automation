package com.project.saleforce.controller.emp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.WageVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.MainSrv;
import com.project.saleforce.service.WageSrv;

@Controller
public class WageCtr {

	@Autowired
	WageSrv wSrv;
	
	@Autowired
	MainSrv mSrv;
	
	@RequestMapping("SFA_wage")
	public ModelAndView getWageList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "empid") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = wSrv.getWageCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<WageVO> list = wSrv.getWageList(start, end, searchOpt, words); 
		
		mav.addObject("com", mSrv.getCompanyInfo());
		mav.addObject("wagelist", list);
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
		
		mav.setViewName("employee/SFA_wage");
		return mav;
	}
	
	@RequestMapping("/wagepopup")
	public ModelAndView getWagePop(@RequestParam String hunum, @RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();
		int count = wSrv.getWageInfoCount(hunum);
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		WageVO wvo = new WageVO();
		List<WageVO> list = wSrv.getWageInfoList(hunum, start, end);
		wvo = wSrv.getWageOne(hunum);
		String empid = wvo.getEmpid();
		String name = wvo.getEmpnm();
		
		mav.addObject("hunum", hunum);
		mav.addObject("empid", empid);
		mav.addObject("name", name);
		mav.addObject("wagelist", list);
		mav.addObject("count", count);
		
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
		
		mav.setViewName("popup/wagepopup");
		
		return mav;
	}
	
	@RequestMapping("/setWage") 
	public String setWage(@ModelAttribute WageVO wvo) {
		String date = wvo.getRegdate().substring(2,4) + wvo.getRegdate().substring(5,7);
		String empid = wvo.getEmpid().substring(4, 10);
		String hunum = wvo.getHugubun() + wvo.getPaygubun() + date + empid;
		
		wvo.setHunum(hunum);
		
		wSrv.setWage(wvo);
		
		//기본테이블 조회를 위해 순번0으로 저장
		wvo.setAllowcd("A");
		wSrv.setWageInfoD(wvo);
		
		wvo.setAllowcd("B");
		wSrv.setWageInfoD(wvo);
		
		
		return "redirect:/SFA_wage";
	}
	
	@RequestMapping("setWageInfo")
	public String setWageInfo(@ModelAttribute WageVO wvo) {			
		if(wvo != null) {		
			wSrv.setWageInfo(wvo);		
		}	
		return "redirect:/wagepopup?hunum="+wvo.getHunum();
	}
	
	@RequestMapping(value = "/getWageOne")
	@ResponseBody
	public WageVO getWageOne(@RequestParam String hunum) {			
		return wSrv.getWageOne(hunum);
	}
	
	
	@RequestMapping(value = "/getWageInfoOne")
	@ResponseBody
	public WageVO getWageInfoOne(@RequestParam String hunum, @RequestParam String seq) {
		int iseq = Integer.parseInt(seq);
		return wSrv.getWageInfoOne(hunum, iseq);
	}
	
	@RequestMapping("updateWage")
	@ResponseBody
	public String updateWage(@ModelAttribute WageVO wvo) {	
		String msg = "";
		
		if(wvo != null) {
			wSrv.updateWage(wvo);
			msg = "success";
			
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("updateWageInfo")
	@ResponseBody
	public String updateWageInfo(@ModelAttribute WageVO wvo) {	
		String msg = "";
		
		if(wvo != null) {
			wSrv.updateWageInfo(wvo);
			msg = "success";
			
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("deleteWage")
	@ResponseBody
	public String deleteWage(@RequestParam String hunum) {
		String msg = "";
		
		if(hunum != "") {
			wSrv.deleteWage(hunum);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	
	
	@RequestMapping("deleteWageInfo")
	@ResponseBody
	public String deleteWageInfo(@RequestParam String hunum, @RequestParam int seq) {
		String msg = "";
		
		if(hunum != "") {
			wSrv.deleteWageInfo(hunum,seq);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("/wageDeleteAll")
	@ResponseBody
	public String wageDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr){
		
		String msg = "";
		if(chkArr != null) {
			
			for(String hunum : chkArr ) { 
				wSrv.deleteWage(hunum);
			}
			msg="success";
			
		}else msg="fail";
		
		return msg;
	}
	
	@RequestMapping("/wageInfoDeleteAll")
	@ResponseBody
	public String wageInfoDeleteAll(@RequestParam(value = "chkArr[]") List<Integer> chkArr, @RequestParam String hunum){
		
		String msg = "";
		
		if(chkArr != null) {
			
			for(int seq : chkArr ) { 
				wSrv.deleteWageInfo(hunum, seq);
			}
			msg="success";
			
		}else msg="fail";
		
		return msg;
	}
	
	@RequestMapping("countDay")
	@ResponseBody
	public int countDay(@RequestParam String stdate, @RequestParam String enddate, @RequestParam String empid, @RequestParam String grade) throws ParseException {
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sDate1 = new SimpleDateFormat("EEE");
		
		Date tempDate = new Date();
		Date strDate = sDate.parse(stdate);
		Date endDate = sDate.parse(enddate);
		
		int end = Integer.parseInt(sDate.format(endDate).substring(8));
		int cnt=0;
		int wage=0; 
		int day=0;
		int dlcount = wSrv.dayCount(empid);
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(strDate);
        

        for(int i=1; i <= end; i++) {
        	tempDate = cal.getTime();
        	if(sDate1.format(tempDate).equals("토") || sDate1.format(tempDate).equals("일")) {

        	}else cnt++;      	
        	cal.add(Calendar.DAY_OF_MONTH, 1);
        }               

        day = cnt - dlcount;
        
        if(grade == "1") wage = 2330000 - day * 105910 ;
        else if(grade == "2") wage = 2830000 - day * 128630;
        else if(grade == "3") wage = 3580000 - day * 162730;
        else if(grade == "4") wage = 4420000 - day * 209910;
        else if(grade == "5") wage = 5250000 - day * 238640;
        else if(grade == "6") wage = 6330000 - day * 287730;
        
		return wage;
	}
	
}
