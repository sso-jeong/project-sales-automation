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
	
	public List<CommuteManageVO> perCommuteList(int start, int end, String searchOpt, String words, String empid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end); 
		map.put("empid", empid);
		
		return sql.selectList("commute.perCommuteList", map);	
	}
	
	public int perCommuteCount(String searchOpt, String words, String empid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empid", empid);
		
		return sql.selectOne("commute.perCommuteCount", map);
	}
	
	public CommuteManageVO getCommuteListOne(String dlnum) {
		return sql.selectOne("commute.getCommuteListOne", dlnum);
	}
	
	public List<CommuteManageVO> commutepopup(String dlnum){		
		return sql.selectList("commute.commutepopup", dlnum);
	}
	
	/*
	 * public void setCommuteOthers(CommuteManageVO commutevo) {
	 * sql.update("commute.setCommuteOthers", commutevo); }
	 */
	
	public void updateCommuteRemark(CommuteManageVO commutevo) {
		sql.update("commute.updateCommuteRemark", commutevo);
	}
	
	public void setCommuteP(CommuteManageVO cvo) {
		sql.insert("commute.setCommuteP", cvo);
	}
	
	public void setCommuteInfoP(CommuteManageVO cvo) {
		sql.insert("commute.setCommuteInfoP", cvo);
	}
	
	public void deleteCommuteInfo(String dlnum) {
		sql.delete("commute.deleteCommuteInfo", dlnum);
		sql.delete("commute.deleteCommute", dlnum);
	}

}
