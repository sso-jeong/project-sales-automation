package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.saleforce.model.BuseoVO;

@Controller
public class BuseoDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<BuseoVO> getBuseoList(){
		return sqlSession.selectList("buseo.getBuseoList");
		
	}
}
