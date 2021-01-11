package com.project.saleforce.controller.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ScheduleVO;
import com.project.saleforce.service.MainSrv;
import com.project.saleforce.service.ScheduleSrv;

@Controller
public class ScheduleCtr {
	@Autowired
	ScheduleSrv sSrv;
	
	@Autowired
	MainSrv mSrv;

	@RequestMapping("SFA_schedule")
	public ModelAndView getSchedule() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("com", mSrv.getCompanyInfo());
		mav.setViewName("schedule/SFA_schedule");
		return mav;
	}

	@RequestMapping("/schedule_add")
	@ResponseBody
	public void setCal(@ModelAttribute ScheduleVO svo) {
		sSrv.setSchedule(svo);
	}

	@RequestMapping("/schedule_list")
	@ResponseBody
	public List<ScheduleVO> getCal(@RequestParam String empid) {
		List<ScheduleVO> list = sSrv.getSchedule(empid);
		return list;
	}
	
	@RequestMapping("/schedule_update")
	@ResponseBody
	public String updateCal(@ModelAttribute ScheduleVO svo) {
		String id =  Integer.toString(svo.getCal_id());
		String msg = "";
		if(id != null) {
			sSrv.updateSchedule(svo);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("/schedule_delete")
	@ResponseBody
	public String delCal(@RequestParam int cal_id) {
		String id = Integer.toString(cal_id);
		String msg = "";
		if(id != null) {
			sSrv.delSchedule(cal_id);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
}
