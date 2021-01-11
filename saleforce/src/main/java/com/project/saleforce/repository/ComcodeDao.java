package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ComcodeVO;

@Repository
public class ComcodeDao {

	@Autowired
	SqlSession sqlSession;

	public List<ComcodeVO> getGrpList() {
		return sqlSession.selectList("com.getGrpList");

	}

	public List<ComcodeVO> getDivList() {
		return sqlSession.selectList("com.getDivList");

	}

	public List<ComcodeVO> getTypeList() {
		return sqlSession.selectList("com.getTypeList");

	}

	public List<ComcodeVO> getDttypeList() {
		return sqlSession.selectList("com.getDttypeList");

	}

	public List<ComcodeVO> getStktypeList() {
		return sqlSession.selectList("com.getStktypeList");

	}

	public List<ComcodeVO> getGenderList() {
		return sqlSession.selectList("com.getGenderList");

	}

	public List<ComcodeVO> getChaList() {
		return sqlSession.selectList("com.getChaList");

	}

	public List<ComcodeVO> getMiliList() {
		return sqlSession.selectList("com.getMiliList");

	}

	public List<ComcodeVO> getImpList() {
		return sqlSession.selectList("com.getImpList");

	}

	public List<ComcodeVO> getPatrList() {
		return sqlSession.selectList("com.getPatrList");

	}

	public List<ComcodeVO> getReliList() {
		return sqlSession.selectList("com.getReliList");

	}

	public List<ComcodeVO> getMarList() {
		return sqlSession.selectList("com.getMarList");

	}

	public List<ComcodeVO> getDlList() {
		return sqlSession.selectList("com.getDlList");

	}

	public List<ComcodeVO> getHuList() {
		return sqlSession.selectList("com.getHuList");

	}

	public List<ComcodeVO> getPayList() {
		return sqlSession.selectList("com.getPayList");

	}

	public List<ComcodeVO> getCaList() {
		return sqlSession.selectList("com.getCaList");

	}

	public List<ComcodeVO> getDatgrpList() {
		return sqlSession.selectList("com.getDatgrpList");

	}

	public List<ComcodeVO> getAprformList() {
		return sqlSession.selectList("com.getAprformList");

	}

	public List<ComcodeVO> getAprcaList() {
		return sqlSession.selectList("com.getAprcaList");

	}

	public List<ComcodeVO> getAprsingList() {
		return sqlSession.selectList("com.getAprsingList");

	}

	public List<ComcodeVO> getReasonList() {
		return sqlSession.selectList("com.getReasonList");

	}

	public List<ComcodeVO> getbirthtype() {
		return sqlSession.selectList("com.getbirthtype");

	}
	
	public List<ComcodeVO> getnoticeList() {
		return sqlSession.selectList("com.getnoticeList");
	}
	
	public List<ComcodeVO> getauthList() {
		return sqlSession.selectList("com.getauthList");
	}
	
	public List<ComcodeVO> getallowList() {
		return sqlSession.selectList("com.getallowList");
	}

}
