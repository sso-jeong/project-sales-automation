package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.WageVO;
import com.project.saleforce.repository.WageDao;

@Service
public class WageSrv {
	
	@Autowired
	WageDao wDao;
	
	public void setWage(WageVO wvo) {
		wDao.setWage(wvo);
	}
	
	public void setWageInfo(WageVO wvo) {
		wDao.setWageInfo(wvo);
	}
	
	public void setWageInfoD(WageVO wvo) {
		wDao.setWageInfoD(wvo);
	}
	
	public List<WageVO> getWageList(int start, int end, String searchOpt,String words){
		return wDao.getWageList(start, end, searchOpt, words);
	}
	
	public List<WageVO> getWageInfoList(String hunum, int start, int end) {
		return wDao.getWageInfoList(hunum, start, end);
	}
	
	public int getWageCount(String searchOpt,String words) {
		return wDao.getWageCount(searchOpt, words);
	}
	
	public int getWageInfoCount(String hunum) {
		return wDao.getWageInfoCount(hunum);
	}
	
	public WageVO getWageOne(String hunum) {
		return wDao.getWageOne(hunum);
	}
	
	public WageVO getWageInfoOne(String hunum, int seq) {
		return wDao.getWageInfoOne(hunum, seq);
	}
	
	public void updateWage(WageVO wvo) {
		wDao.updateWage(wvo);
	}
	
	public void updateWageInfo(WageVO wvo) {
		wDao.updateWageInfo(wvo);
	}
	
	public void deleteWage(String hunum) {
		wDao.deleteWage(hunum);
	}
	
	public void deleteWageInfo(String hunum, int seq) {
		wDao.deleteWageInfo(hunum, seq);
	}
		
	
	public int dayCount(String empid) {
		return wDao.dayCount(empid);
	}
}
