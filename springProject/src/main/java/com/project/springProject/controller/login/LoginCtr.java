package com.project.springProject.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springProject.model.EmpVO;
import com.project.springProject.service.EmpSrv;

@Controller
public class LoginCtr {

	@Autowired
	EmpSrv empSrv;

	@RequestMapping(value = "SFA_login", method = RequestMethod.GET)
	public String getLogin() {
		return "login/SFA_login";
	}
	
	@RequestMapping(value = "SFA_login",  method = RequestMethod.POST)
	@ResponseBody
	public String getLogin(@ModelAttribute EmpVO empvo, HttpSession session) {
		EmpVO vo = empSrv.chkLogin(empvo, session);
		
		String msg;
		if ( vo != null ) {
			//System.out.println(vo.getEmpid());
			//System.out.println(vo.getEmpauth());
			if (vo.getGrade().equals("7")) {
				empSrv.chkLogin(empvo, session);
				msg = "success1";
				
			}else if(vo.getEmpauth().equals("Y")) {
				empSrv.chkLogin(empvo, session);
				msg = "success2";
			}
			
			else {
				msg = "success3";
			}
			
		}else {
			msg = "failure";
		}
		
		return msg;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		empSrv.logout(session);
		return "login/SFA_login";
	}

	@RequestMapping(value = "SFA_Pwd", method = RequestMethod.GET)
	public String getpwdFind() {
		return "login/SFA_Pwd";
	}
	
	@RequestMapping(value = "SFA_Pwd", method = RequestMethod.POST)
	@ResponseBody
	public String setpwdFind(@ModelAttribute EmpVO empvo) {
		
		String result = empSrv.pwdFind(empvo);
		
		if ( result == null ) {
			result = "failure";
		}
		
		System.out.println(result);
		
		return result;
	}


}
