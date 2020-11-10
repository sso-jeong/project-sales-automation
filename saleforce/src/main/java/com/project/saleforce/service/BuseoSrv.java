package com.project.saleforce.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.BuseoVO;
import com.project.saleforce.repository.BuseoDao;

@Service
public class BuseoSrv {
	@Autowired
	BuseoDao buseoDao;
	
	public List<BuseoVO> getBuseoList(){
		return buseoDao.getBuseoList();
		
	}
	

}
