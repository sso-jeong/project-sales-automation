package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.repository.CompanyDao;

@Service
public class CompanySrv {

	@Autowired
	CompanyDao comDao;
	
	public void setCom(CompanyVO comvo) {
		comDao.setCom(comvo);
	}
	
	public List<CompanyVO> getComList(int start, int end, String searchOpt,String words) {
		return comDao.getComList(start, end, searchOpt, words);
	}
	
	
	public int getComCount(String searchOpt,String words) { return
			comDao.getComCount(searchOpt, words); 
	}
	 
}
