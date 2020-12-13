package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.StockVO;

@Repository
public class StockDao {
	@Autowired
	SqlSession sql;
	
	public List<StockVO> getStockList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("stock.getStockList", hs);
	}
	
	public int getStockCount(String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("stock.getStockCount", hs);
	}
	
	public StockVO getOneStock(String itemcd) {
		return sql.selectOne("stock.getOneStock", itemcd);
	}
	
	public List<StockVO> getStockDetail(int start, int end, String searchOpt,String words, String itemcd) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		hs.put("itemcd", itemcd);
		
		return sql.selectList("stock.getStockDetail", hs);
	}
	
	public int getStockDetailCount(String searchOpt,String words, String itemcd) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("itemcd", itemcd);
		
		return sql.selectOne("stock.getStockDetailCount", hs);
	}
	
	public void setStockDetailIn(StockVO svo) {
		sql.insert("stock.setStockDetailIn", svo);
	}
	
	public void setStockDetailOut(StockVO svo) {
		sql.insert("stock.setStockDetailOut", svo);
	}
	
	public void updateStockIn(StockVO svo) {
		sql.update("stock.updateStockIn", svo);
	}
	
	public void updateStockOut(StockVO svo) {
		sql.update("stock.updateStockOut", svo);
	}	
	
	public void deleteStockInfo(String itemcd, int seq) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("itemcd", itemcd);
		hs.put("seq", seq);
		
		sql.delete("stock.deleteStockInfo", hs);
	}
}
