package com.project.springProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.springProject.model.BuseoVO;
import com.project.springProject.repository.BuseoDao;

@Service
public class BuseoSrv {
	
	@Autowired
	BuseoDao buseoDao;
	
	public List<BuseoVO> getBuseoList(){
		return buseoDao.getBuseoList();
	}

}
