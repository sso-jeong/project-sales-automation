package com.project.saleforce.service;

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
}
