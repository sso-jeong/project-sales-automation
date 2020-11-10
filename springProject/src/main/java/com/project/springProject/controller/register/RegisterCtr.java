package com.project.springProject.controller.register;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springProject.model.BuseoVO;
import com.project.springProject.model.EmpVO;
import com.project.springProject.model.GradeVO;
import com.project.springProject.service.BuseoSrv;
import com.project.springProject.service.EmpSrv;
import com.project.springProject.service.GradeSrv;

@Controller // @RequestMapping("/register")
public class RegisterCtr {

	@Autowired
	BuseoSrv buseoSrv;

	@Autowired
	GradeSrv gradeSrv;

	@Autowired
	EmpSrv empSrv;

	@RequestMapping(value = "SFA_register", method = RequestMethod.GET)
	public String getregister() {
		return "register/SFA_register";
	}

	@RequestMapping(value = "SFA_register", method = RequestMethod.POST)
	public String setRegister(@ModelAttribute EmpVO empvo) {
		//System.out.println(empvo);
		//System.out.println(empvo.getEmpid());
		
		int joinDate = Integer.parseInt(empvo.getJoindate().substring(0, 4));
		
		String bCode = empvo.getDeptid();
		
		String eNum = joinDate + bCode;
		empvo.setEmpid(eNum);
		
		empSrv.setRegOne(empvo);
		//System.out.println(empvo.getEmpid());
		return "redirect:/SFA_login";

	}

	@RequestMapping("/getBuseoList")
	@ResponseBody
	public List<BuseoVO> getBuseoList() {
		List<BuseoVO> list = buseoSrv.getBuseoList();
		return list;
	}

	@RequestMapping("/getGradeList")
	@ResponseBody
	public List<GradeVO> getGradeList() {
		List<GradeVO> list = gradeSrv.getGradeList();
		return list;
	}
	
	@RequestMapping(value ="/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam String empid) {
		
		int result = empSrv.idCheck(empid);
		String msg;
		
		if(result > 0) // 以묐났 �븘�씠�뵒媛� �엳�쓣 寃쎌슦
			msg = "failure";
		else
			msg = "success";
		
		return msg;
	}

}
