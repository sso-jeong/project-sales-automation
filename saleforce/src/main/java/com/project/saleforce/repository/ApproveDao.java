package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ApproveVO;

@Repository
public class ApproveDao {

	@Autowired
	SqlSession sql;
	
	public List<ApproveVO> getApprove(int start, int end, String searchOpt, String words, int apprst, String empnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("apprst", apprst);
		map.put("empnm", empnm);
		return sql.selectList("approve.getApprove", map);
	}	
	
	public ApproveVO getOneAppr(String docnum) {
		return sql.selectOne("approve.getOneAppr", docnum);
	}
	
	public int getApprCnt(String searchOpt, String words, int apprst, String empnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("apprst", apprst);
		map.put("empnm", empnm);
		return sql.selectOne("approve.getApprCnt", map);
	}
	
	public void setApprove(ApproveVO avo) {
		sql.insert("approve.setApprove", avo);
	}
	
	public void upApprove(ApproveVO avo) {
		sql.update("approve.upApprove", avo);
	}
	
	public void delApprove(String docnum) {
		sql.delete("approve.delApprove", docnum);
	}
	
	
}
