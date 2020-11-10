package com.project.springProject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.springProject.model.EmpVO;

@Repository
public class EmpDaoImp implements EmpDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void setRegOne(EmpVO empvo) {
		sqlSession.insert("emp.setRegOne", empvo);
	}

	@Override
	public int idCheck(String empid) {
		return sqlSession.selectOne("emp.idCheck", empid);
	}

	@Override
	public EmpVO chkLogin(EmpVO empvo) {
		return sqlSession.selectOne("emp.chkLogin", empvo);
	}

	@Override
	public String pwdFind(EmpVO empvo) {
		return sqlSession.selectOne("emp.pwdFind", empvo);
	}
	
	// ################################# 사원목록 소스 시작   #################################

	@Override
	public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		
		return sqlSession.selectList("emp.getEmpList", map);
	}

	@Override
	public EmpVO getEmpListOne(String empID) {
		return sqlSession.selectOne("emp.getEmpListOne", empID);
	}

	@Override
	public void setEmpOthers(EmpVO empvo) {
		sqlSession.update("emp.setRegAll", empvo);
		
	}

	
	// ################################# 사원목록 소스 끝   #################################
}
