package com.project.saleforce.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;
import com.project.saleforce.model.ComVO;
import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.model.EmpVO;

@Repository
public class MainDao {
	
	@Autowired
	SqlSession sql;
	
	public List<EmpVO> getAuthTen() {
		return sql.selectList("main.getAuthTen");
	}
	
	public void setCompany(ComVO cvo) {
		sql.update("main.setCompany", cvo);
	}
	
	public ComVO getCompany() {
		return sql.selectOne("main.getCompany");
	}
	
	public void upBoard(BoardVO bvo) {
		sql.update("main.upBoard", bvo);
	}
	
	public void setCommute(CommuteManageVO commutevo) {
		sql.insert("main.setCommute", commutevo);
	}
	
	public void setCommuteInfo(CommuteManageVO commutevo) {
		sql.insert("main.setCommuteInfo", commutevo);
	}
	
	public void getStrTime(CommuteManageVO commutevo) {
		sql.update("main.getStrTime", commutevo);
	}
	
	public void getEndTime(CommuteManageVO commutevo) {
		sql.update("main.getEndTime", commutevo);
	}
	
	public void getTotTime(CommuteManageVO cvo) {
		sql.update("main.getTotTime", cvo);
	}
	
	public int commuteCnt(CommuteManageVO commutevo) {
		return sql.selectOne("main.commuteCnt", commutevo);
	}
	
	public int seqCnt(CommuteManageVO commutevo) {
		return sql.selectOne("main.seqCnt", commutevo);
	}
	
	public CommuteManageVO commuLoadMain(String empid) {
		return sql.selectOne("main.commuLoadMain", empid);
	}
	
	public void updateOfftime(CommuteManageVO commutevo) {
		sql.update("main.updateOfftime", commutevo);
	}
	
	public void updatetottime(CommuteManageVO commutevo) {
		sql.update("main.updatetottime", commutevo);
	}
	
	public void dlGubunUp(CommuteManageVO commutevo) {
		sql.update("main.dlGubunUp", commutevo);
	}
	
	public CommuteManageVO getCount(String dlnum) {
		return sql.selectOne("main.getCount", dlnum);
	}
	
	public List<ArticleVO> getAny() {
		return sql.selectList("main.getAny");
	}
	
	public int getAnyCnt() {
		return sql.selectOne("main.getAnyCnt");
	}
	
	public List<ArticleVO> getArtSale() {
		return sql.selectList("main.getArtSale");
	}
	
	public int getArtSaleCnt() {
		return sql.selectOne("main.getArtSaleCnt");
	}	
	
	public List<ArticleVO> getArtHuman() {
		return sql.selectList("main.getArtHuman");
	}
	
	public int getArtHumanCnt() {
		return sql.selectOne("main.getArtHumanCnt");
	}

}
