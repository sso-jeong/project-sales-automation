package com.project.springProject.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.springProject.model.EmpVO;
import com.project.springProject.repository.EmpDao;

@Service
public class EmpSrvImp implements EmpSrv {

	@Autowired
	EmpDao empDao;

	@Override
	public void setRegOne(EmpVO empvo) {
		empDao.setRegOne(empvo);

	}

	@Override
	public int idCheck(String empid) {
		return empDao.idCheck(empid);
	}

	@Override
	public EmpVO chkLogin(EmpVO empvo, HttpSession session) {
		//System.out.println(empvo);
		EmpVO vo = empDao.chkLogin(empvo);
		
		if (vo != null){
			session.setAttribute("empid", vo.getEmpid());
			session.setAttribute("empnm", vo.getEmpnm());
			session.setAttribute("deptid", vo.getDeptid());
			session.setAttribute("grade", vo.getGrade());
			session.setAttribute("empauth", vo.getEmpauth());
		}
		
		return vo;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public String pwdFind(EmpVO empvo) {
		return empDao.pwdFind(empvo);
	}
	
	// ################################# 사원목록 소스 시작   #################################

	@Override
	public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words) {
		return empDao.getEmpList(start, end, searchOpt, words);
	}

	@Override
	public EmpVO getEmpListOne(String empID) {
		return empDao.getEmpListOne(empID);
	}

	@Override
	public void setEmpOthers(EmpVO empvo) {
		empDao.setEmpOthers(empvo);
		
	}

	// ################################# 사원목록 소스 끝   #################################

}
