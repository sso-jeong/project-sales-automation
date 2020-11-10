package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.saleforce.model.EmpVO;

@Controller
public class EmpDao {
	@Autowired
	SqlSession sql;

	public void setEmp(EmpVO evo) {
		sql.insert("emp.setEmp", evo);
	}

	public int idCheck(String empid) {
		return sql.selectOne("emp.idCheck", empid);
	}
	
	public EmpVO setSessionLogin(EmpVO evo) {
		return sql.selectOne("emp.setSessionLogin", evo);
	}
	
	public String pwdFind(EmpVO evo) {
		return sql.selectOne("emp.pwdFind", evo);
	}
	
	public List<EmpVO> getEmpList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		return sql.selectList("emp.getEmpList", hs);
	}

	public int getEmpCount(String searchOpt,String words) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		return sql.selectOne("emp.getEmpCount", hs);
	}
	
	public EmpVO getOneEmp(String empid) {
		return sql.selectOne("emp.getOneEmp", empid);
	}
	
	public void updateEmpAuth(EmpVO evo) {
		sql.update("emp.updateEmpAuth", evo);
	}
	
	public void deleteEmpAuth(String empid) {
		sql.delete("emp.deleteEmpAuth", empid);
	}
	
	public void updateAuth(String empauth, String empid) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("empauth", empauth);
		hs.put("empid", empid);
		sql.update("emp.updateAuth", hs);
	}
	
	
	
}
