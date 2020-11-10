package com.project.springProject.controller.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springProject.service.EmpSrv;

@Controller
public class MainCtr {
	
	@Autowired
	EmpSrv empSrv;
	
	@RequestMapping("")
	public String getMain() {
		return "main/main";
	}
	
	@RequestMapping("SFA_main")
	public String getSFA_main() {
		return "main/SFA_main";
	}
	
	@RequestMapping("SFA_admin")
	public String getAdmin() {
		return "main/SFA_admin";
	}


}
