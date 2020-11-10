package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CodeVO;

@Repository
public class CodeDao {

	@Autowired
	SqlSession sql;
	
	public List<CodeVO> getGrpList() {
		return sql.selectList("code.getGrpList");
	}
	
	public List<CodeVO> getDivList() {
		return sql.selectList("code.getDivList");
	}
}
