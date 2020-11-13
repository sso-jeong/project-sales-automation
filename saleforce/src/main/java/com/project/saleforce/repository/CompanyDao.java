package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CompanyVO;

@Repository
public class CompanyDao {

	@Autowired
	SqlSession sql;
	
	public List<CompanyVO> getCompanyList(){
		return sql.selectList("company.getCompanyList"); 
	}
	
	public void setCompany(CompanyVO comvo) {
		sql.insert("company.setCompany", comvo);
	}
}
