package com.project.springProject.repository;

import java.util.List;

import com.project.springProject.model.EmpVO;

public interface EmpDao {

	public void setRegOne(EmpVO empvo);

	public int idCheck(String empid);

	public EmpVO chkLogin(EmpVO empvo);

	public String pwdFind(EmpVO empvo);

	public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words);

	public EmpVO getEmpListOne(String empID);
	
	public void setEmpOthers(EmpVO empvo);
}
