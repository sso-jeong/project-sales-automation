package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.SaleVO;
import com.project.saleforce.model.StockVO;
import com.project.saleforce.repository.SaleDao;

@Service
public class SaleSrv {
	@Autowired
	SaleDao saleDao;
	
	public List<SaleVO> getSaleList(int start, int end, String searchOpt,String words) {
		return saleDao.getSaleList(start, end, searchOpt, words);
	}
	
	public int getSaleCount(String searchOpt,String words) {
		return saleDao.getSaleCount(searchOpt, words);
	}
	
	public void setSale(SaleVO svo) {
		saleDao.setSale(svo);
	}
	
	public void setStockInfo(StockVO svo) {
		saleDao.setStockInfo(svo);
	}
	
	public SaleVO getItemInf(String itemcd) {
		return saleDao.getItemInf(itemcd);
	}
	
	public String getCompanynm(String comcd) {
		return saleDao.getCompanynm(comcd);
	}
	
	public SaleVO getOneSale(String salenum) {
		return saleDao.getOneSale(salenum);
	}
	
	public void updateSaleInfo(SaleVO svo) {
		saleDao.updateSaleInfo(svo);
	}
	
	public void deleteSaleInfo(String salenum) {
		saleDao.deleteSaleInfo(salenum);
	}
}
