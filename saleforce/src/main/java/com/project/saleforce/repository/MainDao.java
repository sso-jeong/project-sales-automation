package com.project.saleforce.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.CommuteManageVO;

@Repository
public class MainDao {
	
	@Autowired
	SqlSession sql;
	
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

}
