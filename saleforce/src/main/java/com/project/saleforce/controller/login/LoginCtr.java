package com.project.saleforce.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ComVO;
import com.project.saleforce.model.EmpVO;
import com.project.saleforce.service.EmpSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class LoginCtr {

	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	MainSrv mSrv;
	
	@RequestMapping("loginpage")
	public ModelAndView getLogin() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("com", mSrv.getCompanyInfo());
		
		mav.setViewName("login/SFA_login");		
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String setLogin(@ModelAttribute EmpVO evo, HttpSession session) {
		EmpVO vo = empSrv.setSessionLogin(evo, session);
		ComVO cvo = mSrv.getCompanyInfo();
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
		return "redirect:/loginpage";
	}
	
	@RequestMapping("pwdpage")
	public ModelAndView getPwd() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("com", mSrv.getCompanyInfo());
		
		mav.setViewName("login/SFA_Pwd");		
		return mav;
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
