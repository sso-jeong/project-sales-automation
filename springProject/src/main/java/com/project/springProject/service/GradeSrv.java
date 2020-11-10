package com.project.springProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.springProject.model.GradeVO;
import com.project.springProject.repository.GradeDao;

@Service
public class GradeSrv {
	
	@Autowired
	GradeDao gradeDao;
	
	public List<GradeVO> getGradeList(){
		return gradeDao.getGradeList();
	}

}
