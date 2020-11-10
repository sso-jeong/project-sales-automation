package com.project.saleforce.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainCtr {
	
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

}
