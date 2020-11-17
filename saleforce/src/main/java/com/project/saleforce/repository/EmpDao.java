package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.EmpVO;

@Repository
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
	
	// ################################# 사원목록 소스 시작   #################################

		public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("searchOpt", searchOpt);
			map.put("words", words);
			map.put("start", start);
			map.put("end", end); 
			
			return sql.selectList("emp.getEmpList", map);
		}

		public EmpVO getEmpListOne(String empID) {
			return sql.selectOne("emp.getEmpListOne", empID);
		}

		public void setEmpOthers(EmpVO empvo) {
			sql.update("emp.setEmpOthers", empvo);
			
		}
		
		public void setRegAll(EmpVO evo) {
			sql.insert("emp.setRegAll", evo);
		}
		
		// ################################# 사원목록 소스 끝   ##################################
		
	// ### 사내연락망
		public List<EmpVO> getEmpContactList(int start, int end, String searchOpt, String words) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("searchOpt", searchOpt);
			map.put("words", words);
			map.put("start", start);
			map.put("end", end); 
			
			return sql.selectList("emp.getEmpContactList", map);
		}
}
