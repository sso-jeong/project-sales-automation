package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.ApproveVO;
import com.project.saleforce.repository.ApproveDao;

@Service
public class ApproveSrv {

	@Autowired
	ApproveDao aDao;
	
	public List<ApproveVO> getApprove(int start, int end, String searchOpt, String words, int apprst, String empnm) {
		return aDao.getApprove(start, end, searchOpt, words, apprst, empnm);
	}
	
	public ApproveVO getOneAppr(String docnum) {
		return aDao.getOneAppr(docnum);
	}
	
	public int getApprCnt(String searchOpt, String words, int apprst, String empnm) {
		return aDao.getApprCnt(searchOpt, words, apprst, empnm);
	}
	
	public void setApprove(ApproveVO avo) {
		aDao.setApprove(avo);
	}
	
	public void upApprove(ApproveVO avo) {
		aDao.upApprove(avo);
	}
	
	public void delApprove(String docnum) {
		aDao.delApprove(docnum);
	}
}
