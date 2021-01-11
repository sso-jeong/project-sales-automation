package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.OrderVO;

@Repository
public class OrderDao {
	
	@Autowired
	SqlSession sql;
	
	public List<OrderVO> getOrderList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("order.getOrderList", hs);
	}
	
	public List<OrderVO> getOrderPopList(int start, int end, String searchOpt,String words) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("order.getOrderPopList", hs);
	}
	
	public int getOrderCount(String searchOpt,String words) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("order.getOrderCount", hs);
	}
	
	public int getOrderPopCount(String searchOpt,String words) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("order.getOrderPopCount", hs);
	}
	
	public OrderVO getOneOrder(String ordnum) {
		return sql.selectOne("order.getOneOrder", ordnum);
	}
	
	public OrderVO getItemInf(String itemcd) {
		return sql.selectOne("order.getItemInf", itemcd);
	}
	
	public String getCompanynm(String comcd) {
		return sql.selectOne("order.getCompanynm", comcd);
	}
	
	public void setOrder(OrderVO ovo) {
		sql.insert("order.setOrder", ovo);
	}	
	
	public void updateOrderInfo(OrderVO ovo) {
		sql.update("order.updateOrderInfo", ovo);
	}
	
	public void deleteOrderInfo(String ordnum) {
		sql.delete("order.deleteOrderInfo", ordnum);
	}
}
