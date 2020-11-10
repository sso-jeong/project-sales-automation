package com.project.saleforce.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.saleforce.model.EmpVO;
import com.project.saleforce.service.EmpSrv;

@Controller
public class LoginCtr {

	@Autowired
	EmpSrv empSrv;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {
		return "login/SFA_login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String setLogin(@ModelAttribute EmpVO evo, HttpSession session) {
		EmpVO vo = empSrv.setSessionLogin(evo, session);
		
		String msg="";
		
		if (vo != null) {
			if(vo.getDeptid().equals("777")) {
				msg = "admin";
			}
			else if (vo.getEmpauth().equals("N")) {
				msg = "noauth";
			} else {
				msg = "standard";
			} 
		} else {
			msg ="fail";			
		}

		return msg;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		empSrv.logout(session);
		return "login/SFA_login";
	}

	@RequestMapping(value = "/pwdFind", method = RequestMethod.GET)
	public String getPwd() {
		return "login/SFA_Pwd";
	}

	@RequestMapping(value = "/pwdFind", method = RequestMethod.POST)
	@ResponseBody
	public String setPwd(@ModelAttribute EmpVO evo) {
		String msg = empSrv.pwdFind(evo);
		if (msg == null) {
			msg = "fail";
		}
		return msg;
	}

}
