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
		commutevo.setRegdate(commutevo.getRegdate().substring(0, 10));
		
		mainSrv.setCommute(commutevo);		
		mainSrv.setCommuteInfo(commutevo);		
		mainSrv.getStrTime(commutevo);		

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
		commutevo.setSeq(commutevo.getSeq());
		
		mainSrv.updateOfftime(commutevo);
		mainSrv.getEndTime(commutevo);
		mainSrv.updatetottime(commutevo);

		return "redirect:/SFA_main";
	}
	
	@RequestMapping(value="/dlGubunUp", method=RequestMethod.POST)
	@ResponseBody
	public String dlGubunUp(CommuteManageVO commutevo) {
		
		String dldate = commutevo.getDldate().substring(0,4) + commutevo.getDldate().substring(5,7) + commutevo.getDldate().substring(8,10);
		
		commutevo.setDldate(dldate);
		
		int count = mainSrv.commuteCnt(commutevo); // 근태기본테이블 체크
		int seqCnt = mainSrv.seqCnt(commutevo); // 근태상세테이블 체크
		
		commutevo.setSeq(commutevo.getSeq());
		
		//예외처리
		if (count == 0) {
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
			commutevo.setRegdate(commutevo.getRegdate().substring(0, 10));
			
			mainSrv.setCommute(commutevo);
			mainSrv.setCommuteInfo(commutevo);
			mainSrv.getStrTime(commutevo);		
			
		}else if(seqCnt == 1){
			mainSrv.dlGubunUp(commutevo); // 근태기본테이블 근태유형 업데이트
			mainSrv.getEndTime(commutevo); // 근태상세테이블 기존 근태유형 종료시간 업데이트
			
			mainSrv.setCommuteInfo(commutevo); // 근태상세테이블 새로운 근태유형 삽입
			
			commutevo.setSeq(commutevo.getSeq());
			mainSrv.getStrTime(commutevo); // 근태상세테이블 새로운 근태유형 시간 업데이트
			
		}

		return "redirect:/SFA_main";
	}
	

}
