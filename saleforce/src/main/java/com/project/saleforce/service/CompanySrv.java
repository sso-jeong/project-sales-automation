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
	
	public List<CompanyVO> getCompanyList(){
		return companyDao.getCompanyList();
	}
	
	public void setCompany(CompanyVO comvo) {
		companyDao.setCompany(comvo);
	}

}
