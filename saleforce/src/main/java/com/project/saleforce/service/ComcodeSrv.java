package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.ComcodeVO;
import com.project.saleforce.repository.ComcodeDao;

@Service
public class ComcodeSrv {

	@Autowired
	ComcodeDao comcodeDao;

	public List<ComcodeVO> getGrpList() {
		return comcodeDao.getGrpList();
	}

	public List<ComcodeVO> getDivList() {
		return comcodeDao.getDivList();

	}

	public List<ComcodeVO> getTypeList() {
		return comcodeDao.getTypeList();

	}

	public List<ComcodeVO> getDttypeList() {
		return comcodeDao.getDttypeList();

	}

	public List<ComcodeVO> getStktypeList() {
		return comcodeDao.getStktypeList();

	}

	public List<ComcodeVO> getGenderList() {
		return comcodeDao.getGenderList();

	}

	public List<ComcodeVO> getChaList() {
		return comcodeDao.getChaList();

	}

	public List<ComcodeVO> getMiliList() {
		return comcodeDao.getMiliList();

	}

	public List<ComcodeVO> getImpList() {
		return comcodeDao.getImpList();

	}

	public List<ComcodeVO> getPatrList() {
		return comcodeDao.getPatrList();

	}

	public List<ComcodeVO> getReliList() {
		return comcodeDao.getReliList();

	}

	public List<ComcodeVO> getMarList() {
		return comcodeDao.getMarList();

	}

	public List<ComcodeVO> getDlList() {
		return comcodeDao.getDlList();

	}

	public List<ComcodeVO> getHuList() {
		return comcodeDao.getHuList();

	}

	public List<ComcodeVO> getPayList() {
		return comcodeDao.getPayList();

	}

	public List<ComcodeVO> getCaList() {
		return comcodeDao.getCaList();

	}

	public List<ComcodeVO> getDatgrpList() {
		return comcodeDao.getDatgrpList();

	}

	public List<ComcodeVO> getAprformList() {
		return comcodeDao.getAprformList();

	}

	public List<ComcodeVO> getAprcaList() {
		return comcodeDao.getAprcaList();
	}

	public List<ComcodeVO> getAprsingList() {
		return comcodeDao.getAprsingList();

	}

	public List<ComcodeVO> getReasonList() {
		return comcodeDao.getReasonList();

	}
	
	public List<ComcodeVO> getbirthtype() {
		return comcodeDao.getbirthtype();

	}
}
