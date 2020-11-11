package com.project.saleforce.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CompanyVO;

@Repository
public class CompanyDao {
	SqlSession sql;
	
	public void setCom(CompanyVO comvo) {
		sql.insert("company.setCom", comvo);
	}
}
