package com.project.saleforce.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.GradeVO;
import com.project.saleforce.repository.GradeDao;

@Service
public class GradeSrv {
	@Autowired
	GradeDao gradeDao;
	
	public List<GradeVO> getGradeList(){
		return gradeDao.getGradeList();
		
	}
	
	
}
