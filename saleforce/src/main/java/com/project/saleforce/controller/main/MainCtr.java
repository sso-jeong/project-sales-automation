package com.project.saleforce.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.model.EmpVO;
import com.project.saleforce.service.MainSrv;

@Controller
public class MainCtr {

	@Autowired
	MainSrv mainSrv;

	@RequestMapping("")
	public String getMain() {
		return "main/main";
	}

	@RequestMapping("/SFA_main")
	public String getSfaMain() {
		return "main/SFA_main";
	}

	@RequestMapping("/SFA_admin")
	public String getSfaAdmin() {
		return "main/SFA_admin";
	}

	// 근태

	@RequestMapping(value = "setCommute", method = RequestMethod.POST)
	public String setCommute(@ModelAttribute CommuteManageVO commutevo) {		
		//System.out.println(commutevo.getRegdate());
		String mDay = commutevo.getRegdate().substring(5, 7) + commutevo.getRegdate().substring(8, 10);
		
		String date = commutevo.getRegdate().substring(2, 4) + mDay;
		String dlDate = commutevo.getRegdate().substring(0, 4) + mDay;
		String ontime = commutevo.getRegtime();
		String empid = commutevo.getEmpid().substring(4, 10);

		String dlnum = date + empid;
		
		commutevo.setDlnum(dlnum); // 근태번호
		commutevo.setDlgubun(commutevo.getDlnm()); // 근태구분
		commutevo.setDldate(dlDate); // 근태일자
		commutevo.setOntime(ontime); // 출근시간
		commutevo.setStrtime(ontime);
		commutevo.setRegdate(commutevo.getRegdate().substring(0, 10));
		
		mainSrv.setCommute(commutevo);
		mainSrv.setCommuteInfo(commutevo);
		
		commutevo.setSeq(commutevo.getSeq());
		
		String strtime = commutevo.getStrtime();
		
		if (strtime == null) 
			mainSrv.getStrTime(commutevo);
		else
			mainSrv.getEndTime(commutevo);

		return "redirect:/SFA_main";
	}

	@RequestMapping("commuLoadMain")
	@ResponseBody
	public CommuteManageVO commuLoadMain(String empid) {
		return mainSrv.commuLoadMain(empid);
	}
	
	@RequestMapping(value="/updateOfftime", method=RequestMethod.POST)
	@ResponseBody
	public String updateOfftime(CommuteManageVO commutevo) {
		mainSrv.updateOfftime(commutevo);
		mainSrv.updateEndTime(commutevo);
		mainSrv.updatetottime(commutevo);

		return "redirect:/SFA_main";
	}
	
	@RequestMapping(value="/dlInfoInsert", method=RequestMethod.POST)
	@ResponseBody
	public String dlInfoInsert(CommuteManageVO commutevo) {

		String strtime = commutevo.getStrtime();
		commutevo.setSeq(commutevo.getSeq());
		
		mainSrv.dlInfoInsert(commutevo);
		mainSrv.setCommuteInfo(commutevo);
		
		System.out.println(commutevo.getEndtime());
		
		if (strtime == null) 
			mainSrv.getStrTime(commutevo);
		else
			mainSrv.getEndTime(commutevo);

		return "redirect:/SFA_main";
	}

}
