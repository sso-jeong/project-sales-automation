package com.project.saleforce.controller.sale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderCtr {

	@RequestMapping("SFA_order_manage")
	public String getOrder() {
		return "sale/SFA_order_manage";
	}
}
