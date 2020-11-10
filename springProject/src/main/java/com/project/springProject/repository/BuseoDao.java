package com.project.springProject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.springProject.model.BuseoVO;

@Repository
public class BuseoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<BuseoVO> getBuseoList(){
		return sqlSession.selectList("buseo.getBuseoList");
		
	}

}
