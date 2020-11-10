package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.EmpVO;

@Repository
public class ManageDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<EmpVO> getAuthList(int start, int end, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		
		return sqlSession.selectList("manage.getAuthList", map);
	}
	
	public int getAuthCount(String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sqlSession.selectOne("manage.getAuthCount", map);
	}
	
	public EmpVO getAuthListOne(String empID) {
		return sqlSession.selectOne("manage.getAuthListOne", empID);	
	}
	
	public void setAuthChange(EmpVO evo) {
		sqlSession.update("manage.setAuthChange", evo);
	}
	
	public void setConfirmChange(String empAuth, String empID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("empAuth", empAuth);
		map.put("empID", empID);
		
		sqlSession.update("manage.setConfirmChange", map);
	}
	
	public void setAuthDel(String empid) {
		sqlSession.delete("manage.setAuthDel", empid);
	}

}
