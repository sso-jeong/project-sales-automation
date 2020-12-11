package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CommuteManageVO;

@Repository
public class CommuteDao {
	@Autowired
	SqlSession sql;
	
	public List<CommuteManageVO> getCommuteList(int start, int end, String searchOpt, String words){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		
		return sql.selectList("commute.getCommuteList", map);
		
	}
	
	public int getCommuteCount(String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne("commute.getCommuteCount", map);
	}
	
	public CommuteManageVO getCommuteListOne(String dlnum) {
		return sql.selectOne("commute.getCommuteListOne", dlnum);
	}
	
	public List<CommuteManageVO> commutepopup(int start, int end, String searchOpt, String words){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		
		return sql.selectList("commute.commutepopup", map);
	}
	
	public int commutepopupCnt(String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne("commute.commutepopupCnt", map);
	}
	
	public void setCommuteOthers(CommuteManageVO commutevo) {
		sql.update("commute.setCommuteOthers", commutevo);
	}
	
	public void updateCommuteRemark(CommuteManageVO commutevo) {
		sql.update("commute.updateCommuteRemark", commutevo);
	}

}
