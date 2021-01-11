package com.project.saleforce.controller.register;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.BuseoVO;
import com.project.saleforce.model.EmpVO;
import com.project.saleforce.model.GradeVO;
import com.project.saleforce.service.BuseoSrv;
import com.project.saleforce.service.EmpSrv;
import com.project.saleforce.service.GradeSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class registerCtr {
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	BuseoSrv buseoSrv;
	
	@Autowired
	GradeSrv gradeSrv;
	
	@Autowired
	MainSrv mSrv;
	
	
	@RequestMapping("/getBuseoList")
	@ResponseBody
	public List<BuseoVO> getBuseoList() {
		List<BuseoVO> list = buseoSrv.getBuseoList();
		return list;
	}
	
	@RequestMapping("/getGradeList")
	@ResponseBody
	public List<GradeVO> getGradeList(){
		List<GradeVO> list = gradeSrv.getGradeList();
		return list;
	}
		
	@RequestMapping("registerpage")
	public ModelAndView getRegister() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("com", mSrv.getCompanyInfo());
		
		mav.setViewName("register/SFA_register");		
		return mav;
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST) //서버 실행시 첫 화면
	public String getRegisterDO(@ModelAttribute EmpVO evo) {
		
		int enter = Integer.parseInt(evo.getJoindate().substring(0,4));
		String dept = evo.getDeptid();
		String empid = enter + dept;
		evo.setEmpid(empid);
		
		empSrv.setEmp(evo);
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam String empid) {
		int result = empSrv.idCheck(empid);
		String msg = null;
		
		if(result > 0) {
			msg = "NO";
		}else {
			msg = "OK";
		}
		
		return msg;
	}
	
}
