package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.repository.CompanyDao;

@Service
public class CompanySrv {
	@Autowired
	CompanyDao companyDao;
	
	public List<CompanyVO> getCompanyList(int start, int end, String searchOpt, String words){
		return companyDao.getCompanyList(start, end, searchOpt, words);
	}
	
	public int getCompanyCount(String searchOpt, String words) {
		return companyDao.getCompanyCount(searchOpt, words);
	}
	
	public CompanyVO getOneCompany(String comcd) {
		return companyDao.getOneCompany(comcd);
	}
	
	public void setCompany(CompanyVO comvo) {
		companyDao.setCompany(comvo);
	}
	
	public void updateCompanyInfo(CompanyVO comvo) {
		companyDao.updateCompanyInfo(comvo);
	}
	
	public void deleteCompanyInfo(String comcd) {
		companyDao.deleteCompanyInfo(comcd);
	}

}
