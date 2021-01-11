package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.OrderVO;
import com.project.saleforce.repository.OrderDao;

@Service
public class OrderSrv {
	
	@Autowired
	OrderDao ordDao;
	
	public List<OrderVO> getOrderList(int start, int end, String searchOpt,String words) {
		return ordDao.getOrderList(start, end, searchOpt, words);
	}
	
	public List<OrderVO> getOrderPopList(int start, int end, String searchOpt,String words) {
		return ordDao.getOrderPopList(start, end, searchOpt, words);
	}
	
	public OrderVO getOneOrder(String ordnum) {
		return ordDao.getOneOrder(ordnum);
	}
	
	public OrderVO getItemInf(String itemcd) {
		return ordDao.getItemInf(itemcd);
	}
	
	public String getCompanynm(String comcd) {
		return ordDao.getCompanynm(comcd);
	}
	
	public int getOrderCount(String searchOpt, String words) {
		return ordDao.getOrderCount(searchOpt, words);
	}
	
	public int getOrderPopCount(String searchOpt,String words) {
		return ordDao.getOrderPopCount(searchOpt, words);
	}
	
	public void setOrder(OrderVO ovo) {
		ordDao.setOrder(ovo);
	}
	
	public void updateOrderInfo(OrderVO ovo) {
		ordDao.updateOrderInfo(ovo);
	}
	
	public void deleteOrderInfo(String ordnum) {
		ordDao.deleteOrderInfo(ordnum);
	}

}
