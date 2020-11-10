package com.project.saleforce.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.EmpVO;
import com.project.saleforce.repository.EmpDao;

@Service
public class EmpSrv {
	@Autowired
	EmpDao empDao;

	public void setEmp(EmpVO evo) {
		empDao.setEmp(evo);
	}

	public int idCheck(String empid) {
		return empDao.idCheck(empid);
	}

	public EmpVO setSessionLogin(EmpVO evo, HttpSession session) {
		EmpVO vo = empDao.setSessionLogin(evo);

		if (vo != null) {
			session.setAttribute("empid", vo.getEmpid());
			session.setAttribute("empname", vo.getEmpnm());
			session.setAttribute("deptid", vo.getDeptid());
			session.setAttribute("grade", vo.getGrade());
			session.setAttribute("empauth", vo.getEmpauth());
			session.setAttribute("nowdate", vo.getRegdate());
		}

		return vo;
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public String pwdFind(EmpVO evo) {
		return empDao.pwdFind(evo);
	}
	
	public List<EmpVO> getEmpList(int start, int end, String searchOpt,String words) {
		return empDao.getEmpList(start, end, searchOpt, words);
	}
	
	public int getEmpCount(String searchOpt,String words) {
		return empDao.getEmpCount(searchOpt, words);
	}
	
	public EmpVO getOneEmp(String empid) {
		return empDao.getOneEmp(empid);
	}
	
	public void updateEmpAuth(EmpVO evo) {
		empDao.updateEmpAuth(evo);
	}

	public void deleteEmpAuth(String empid) {
		empDao.deleteEmpAuth(empid);
	}
	
	public void updateAuth(String empauth, String empid) {
		empDao.updateAuth(empauth, empid);
	}
}
