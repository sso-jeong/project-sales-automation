package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.ScheduleVO;
import com.project.saleforce.repository.ScheduleDao;

@Service
public class ScheduleSrv {
	
	@Autowired
	ScheduleDao sDao;
	
	public void setSchedule(ScheduleVO svo) {
		sDao.setSchedule(svo);
	}
	
	public List<ScheduleVO> getSchedule(String empid) {
		return sDao.getSchedule(empid);
	}
	
	public void updateSchedule(ScheduleVO svo) {
		sDao.updateSchedule(svo);
	}
	
	public void delSchedule(int cal_id) {
		sDao.delSchedule(cal_id);
	}

}
