package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.ItemVO;
import com.project.saleforce.model.StockVO;
import com.project.saleforce.repository.ItemDao;

@Service
public class ItemSrv {

	@Autowired
	ItemDao itemDao;
	
	public void setItem(ItemVO ivo) {
		itemDao.setItem(ivo);
	}
	
	public void setStock(StockVO svo) {
		itemDao.setStock(svo);
	}
	
	public List<ItemVO> getItemList(int start, int end, String searchOpt,String words) {
		return itemDao.getItemList(start, end, searchOpt, words);
	}
	
	public int getItemCount(String searchOpt,String words) {
		return itemDao.getItemCount(searchOpt, words);
	}
	
	public ItemVO getOneItem(String itemcd) {
		return itemDao.getOneItem(itemcd);
	}
	
	public void updateItemInfo(ItemVO ivo) {
		itemDao.updateItemInfo(ivo);
	}
	public void updateItemInfoNo(ItemVO ivo) {
		itemDao.updateItemInfoNo(ivo);
	}
	
	public void updateImgup(ItemVO ivo) {
		itemDao.updateImgup(ivo);
	}
	
	public void updateStd(ItemVO ivo) {
		itemDao.updateStd(ivo);
	}
	
	public void deleteItemInfo(String itemcd) {
		itemDao.deleteItemInfo(itemcd);
	}
}
