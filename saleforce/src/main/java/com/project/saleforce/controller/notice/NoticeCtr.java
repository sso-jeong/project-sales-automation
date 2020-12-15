package com.project.saleforce.controller.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCtr {

	@RequestMapping("SFA_notice_manage")
	public ModelAndView getNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/SFA_notice_manage");
		
		return mav;
	}
}
