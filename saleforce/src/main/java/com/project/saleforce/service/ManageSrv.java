package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.EmpVO;
import com.project.saleforce.repository.ManageDao;

@Service
public class ManageSrv {
	
	@Autowired
	ManageDao mDao;
	
	public List<EmpVO> getAuthList(int start, int end, String searchOpt, String words) {
		return mDao.getAuthList(start, end, searchOpt, words);
	}
	
	public int getAuthCount(String searchOpt, String words) {
		return mDao.getAuthCount(searchOpt, words);
	}
	
	public EmpVO getAuthListOne(String empID) {
		return mDao.getAuthListOne(empID);
	}

	public void setAuthChange(EmpVO evo) {
		mDao.setAuthChange(evo);
	}
	
	public void setConfirmChange(String empAuth, String empID) {
		mDao.setConfirmChange(empAuth, empID);
	}
	
	public void setAuthDel(String empid) {
		mDao.setAuthDel(empid);
	}
	

}
