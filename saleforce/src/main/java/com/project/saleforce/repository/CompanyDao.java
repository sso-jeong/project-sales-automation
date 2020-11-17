package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CompanyVO;

@Repository
public class CompanyDao {

	@Autowired
	SqlSession sql;
	
	public List<CompanyVO> getCompanyList(int start, int end, String searchOpt, String words){
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("company.getCompanyList", hs); 
	}
	
	public int getCompanyCount(String searchOpt, String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("company.getCompanyCount",hs);
	}
	
	public CompanyVO getOneCompany(String comcd) {
		return sql.selectOne("company.getOneCompany", comcd);
	}
	
	public void setCompany(CompanyVO comvo) {
		sql.insert("company.setCompany", comvo);
	}	
	
	public void updateCompanyInfo(CompanyVO comvo) {
		sql.update("company.updateCompanyInfo", comvo);
	}
	
	public void deleteCompanyInfo(String comcd) {
		sql.delete("company.deleteCompanyInfo", comcd);
	}
}
