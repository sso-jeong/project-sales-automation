package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.repository.CommuteDao;

@Service
public class CommuteSrv {
	
	@Autowired
	CommuteDao commuDao;
	
	public List<CommuteManageVO> getCommuteList(int start, int end, String searchOpt, String words){
		return commuDao.getCommuteList(start, end, searchOpt, words);
	}
	
	public int getCommuteCount(String searchOpt, String words) {
		return commuDao.getCommuteCount(searchOpt, words);
	}
	
	public CommuteManageVO getCommuteListOne(String dlnum) {
		return commuDao.getCommuteListOne(dlnum);
	}
	
	public void setCommuteOthers(CommuteManageVO commutevo) {
		commuDao.setCommuteOthers(commutevo);
	}
	
	public void updateCommuteRemark(CommuteManageVO commutevo) {
		commuDao.updateCommuteRemark(commutevo);
	}

}
