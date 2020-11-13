package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CodeVO;
import com.project.saleforce.repository.CodeDao;

@Service
public class CodeSrv {
	
	@Autowired
	CodeDao codeDao;
	
	public List<CodeVO> getGrpList() {
		return codeDao.getGrpList();
	}
	
	public List<CodeVO> getDivList() {
		return codeDao.getDivList();
	}
}
