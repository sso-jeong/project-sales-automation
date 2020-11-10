package com.project.springProject.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.springProject.model.EmpVO;

public interface EmpSrv {

	public void setRegOne(EmpVO empvo);

	public int idCheck(String empid);
	
	public EmpVO chkLogin(EmpVO empvo, HttpSession session);	
	
	public void logout(HttpSession session);
	
	public String pwdFind(EmpVO empvo);
	
	public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words);
	
	public EmpVO getEmpListOne(String empID);
	
	public void setEmpOthers(EmpVO empvo);
}
