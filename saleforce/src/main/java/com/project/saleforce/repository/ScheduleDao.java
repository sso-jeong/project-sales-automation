package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ScheduleVO;

@Repository
public class ScheduleDao {
	
	@Autowired
	SqlSession sql;
	
	public void setSchedule(ScheduleVO svo) {
		sql.insert("schedule.setSchedule", svo);
	}
	
	public List<ScheduleVO> getSchedule(String empid) {
		return sql.selectList("schedule.getSchedule", empid);
	}
	
	public void updateSchedule(ScheduleVO svo) {
		sql.update("schedule.updateSchedule", svo);
	}
	
	public void delSchedule(int cal_id) {
		sql.delete("schedule.delSchedule", cal_id);
	}

}
