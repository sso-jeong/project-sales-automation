package com.project.saleforce.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.saleforce.model.ItemVO;

@Repository
public class ItemDao {

	@Autowired
	SqlSession sql;
	
	public void setItem(ItemVO ivo) {
		sql.insert("item.setItem", ivo);
	}
	
	public List<ItemVO> getItemList(int start, int end, String searchOpt,String words) {
		
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		hs.put("start", start);
		hs.put("end", end);
		
		return sql.selectList("item.getItemList", hs);
	}
	
	public int getItemCount(String searchOpt,String words) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("searchOpt", searchOpt);
		hs.put("words", words);
		
		return sql.selectOne("item.getItemCount", hs);
	}
	
	public ItemVO getOneItem(String itemcd) {
		return sql.selectOne("item.getOneItem", itemcd);
	}
	
	public void updateItemInfo(ItemVO ivo) {
		sql.update("item.updateItemInfo", ivo);
	}
	
	public void deleteItemInfo(String itemcd) {
		sql.delete("item.deleteItemInfo", itemcd);
	}
}
