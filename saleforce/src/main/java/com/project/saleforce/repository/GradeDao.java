package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.saleforce.model.GradeVO;

@Controller
public class GradeDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<GradeVO> getGradeList(){
		return sqlSession.selectList("grade.getGradeList");
		
	}
}
