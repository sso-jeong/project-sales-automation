package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.WageVO;

@Repository
public class WageDao {

	@Autowired
	SqlSession sql;
	
	public void setWage(WageVO wvo) {
		sql.insert("wage.setWage", wvo);
	}
	
	public void setWageInfo(WageVO wvo) {
		sql.insert("wage.setWageInfo", wvo);
	}
	
	public void setWageInfoD(WageVO wvo) {
		sql.insert("wage.setWageInfoD", wvo);
	}
	
	public List<WageVO> getWageList(int start, int end, String searchOpt,String words){
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("wage.getWageList", hs);
	}
	
	public List<WageVO> getWageInfoList(String hunum, int start, int end) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("hunum", hunum);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("wage.getWageInfoList", hs);
	}
	
	public int getWageCount(String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("wage.getWageCount", hs);
	}
	
	public int getWageInfoCount(String hunum) {
		return sql.selectOne("wage.getWageInfoCount", hunum);
	}
	
	public WageVO getWageOne(String hunum) {
		return sql.selectOne("wage.getWageOne", hunum);
	}
	
	public WageVO getWageInfoOne(String hunum, int seq) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("hunum", hunum);
		hs.put("seq", seq);
		String seq2 = String.valueOf(hs.get("seq"));
		hs.replace("seq", seq, seq2);
		
		return sql.selectOne("wage.getWageInfoOne", hs);
	}
	
	public void updateWage(WageVO wvo) {
		sql.update("wage.updateWage", wvo);
	}
	
	public void updateWageInfo(WageVO wvo) {
		sql.update("wage.updateWageInfo", wvo);
	}
	
	public void deleteWage(String hunum) {
		sql.delete("wage.deleteWage", hunum);
	}
	
	public void deleteWageInfo(String hunum, int seq) {	
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("hunum", hunum);
		hs.put("seq", seq);		
		String seq2 = String.valueOf(hs.get("seq"));
		hs.replace("seq", seq, seq2);
			
		sql.delete("wage.deleteWageInfo", hs);
	}

	public int dayCount(String empid) {
		return sql.selectOne("wage.dayCount", empid);
	}
}
