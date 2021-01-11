package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.SaleVO;
import com.project.saleforce.model.StockVO;

@Repository
public class SaleDao {
	
	@Autowired
	SqlSession sql;
	
	public List<SaleVO> getSaleList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("sale.getSaleList", hs);
	}
	
	public int getSaleCount(String searchOpt,String words) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("sale.getSaleCount", hs);
	}
	
	public SaleVO getItemInf(String itemcd) {
		return sql.selectOne("sale.getItemInf", itemcd);
	}
	
	public String getCompanynm(String comcd) {
		return sql.selectOne("sale.getCompanynm", comcd);
	}
	
	public SaleVO getOneSale(String salenum) {
		return sql.selectOne("sale.getOneSale", salenum);
	}
	
	public void setSale(SaleVO svo) {
		sql.insert("sale.setSale", svo);
	}
	
	public void setStockInfo(StockVO svo) {
		sql.insert("sale.setStockInfo", svo);
	}
	
	public void updateYN(String ordnum) {
		sql.update("sale.updateYN", ordnum);
	}
	
	public void updateSaleInfo(SaleVO svo) {
		sql.update("sale.updateSaleInfo", svo);
	}
	
	public void updateStock(StockVO svo) {
		sql.update("sale.updateStock", svo);
	}
	
	public void deleteSaleInfo(String salenum) {
		sql.delete("sale.deleteSaleInfo", salenum);
	}
	
	public void deleteStock(String salenum) {
		sql.delete("sale.deleteStock", salenum);
	}
}
