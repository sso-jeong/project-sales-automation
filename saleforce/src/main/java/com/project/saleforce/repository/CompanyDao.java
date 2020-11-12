package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CompanyVO;

@Repository
public class CompanyDao {
	SqlSession sql;
	
	public void setCom(CompanyVO comvo) {
		sql.insert("company.setCom", comvo);
	}
	
	public List<CompanyVO> getComList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("company.getComList", hs);
	}
	
	
	  public int getComCount(String searchOpt, String words) { 
		  HashMap<String,String> hs = new HashMap<String, String>(); 
		  hs.put("searchOpt", searchOpt);
		  hs.put("words", words);
	  
		  return sql.selectOne("company.getComCount", hs); 
	  }
	 
}
