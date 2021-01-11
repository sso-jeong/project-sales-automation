package com.project.saleforce.controller.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.CompanyVO;
import com.project.saleforce.model.ItemVO;
import com.project.saleforce.model.OrderVO;
import com.project.saleforce.model.SaleVO;
import com.project.saleforce.model.StockVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.CompanySrv;
import com.project.saleforce.service.ItemSrv;
import com.project.saleforce.service.MainSrv;
import com.project.saleforce.service.OrderSrv;
import com.project.saleforce.service.SaleSrv;

@Controller
public class SaleCtr {
	@Autowired
	SaleSrv sSrv;
	
	@Autowired
	OrderSrv oSrv;
	
	@Autowired
	ItemSrv iSrv;
	
	@Autowired
	CompanySrv cSrv;
	
	@Autowired
	MainSrv mSrv;
	
	@RequestMapping("SFA_sale_manage")
	public ModelAndView getSaleList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "salenum") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = sSrv.getSaleCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<SaleVO> list = sSrv.getSaleList(start, end, searchOpt, words);
		
		mav.addObject("com", mSrv.getCompanyInfo());
		mav.addObject("salelist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); 
		mav.addObject("end", end);
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		mav.addObject("selected", pager.getCurPage());
		
		mav.setViewName("sale/SFA_sale_manage");
		return mav;
	}
	
	@RequestMapping(value = "/salePopup")
	public ModelAndView getSPopup(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "ordnum") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = oSrv.getOrderPopCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<OrderVO> list = oSrv.getOrderPopList(start, end, searchOpt, words);
		
		mav.addObject("orderlist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); 
		mav.addObject("end", end);
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		mav.addObject("selected", pager.getCurPage());
		mav.setViewName("popup/spopup");
		return mav;
	}
	
	@RequestMapping(value = "/itemPopup")
	public ModelAndView getIPopup(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "itemnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = iSrv.getItemCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<ItemVO> list = iSrv.getItemList(start, end, searchOpt, words);
		
		mav.addObject("itemlist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); 
		mav.addObject("end", end);
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		mav.addObject("selected", pager.getCurPage());
		mav.setViewName("popup/ipopup");
		return mav;
	}
	
	@RequestMapping(value = "/companyPopup")
	public ModelAndView getCPopup(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "comnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = cSrv.getCompanyCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<CompanyVO> list = cSrv.getCompanyList(start, end, searchOpt, words);
		
		mav.addObject("companylist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); 
		mav.addObject("end", end);
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		mav.addObject("selected", pager.getCurPage());
		mav.setViewName("popup/cpopup");
		return mav;
	}
	
	@RequestMapping(value = "/getOneSale")
	@ResponseBody
	public SaleVO getOneSale(@RequestParam String salenum) {			
		return sSrv.getOneSale(salenum);
	}
		
	@RequestMapping(value = "/getItemInfS")
	@ResponseBody
	public SaleVO getItemInfS(@RequestParam String itemcd) {			
		return sSrv.getItemInf(itemcd);
	}
	
	@RequestMapping(value = "/getCompanynmS", produces = "application/text; charset=utf8")
	public @ResponseBody String getCompanynmS(@RequestParam String comcd) {
		String msg = sSrv.getCompanynm(comcd);	
		
		if(msg == null) msg = "zero"; 
		return msg;
	}
	
	@RequestMapping(value = "setSale", method = RequestMethod.POST)
	public String setSale(@ModelAttribute SaleVO svo) {
		String name = svo.getInsert_person();
		String date = svo.getRegdate().substring(0,4) + svo.getRegdate().substring(5,7) + svo.getRegdate().substring(8,10);
		String salenum = date;
		
		svo.setInsert_person(name);
		svo.setSalenum(salenum);
		svo.setRegdate(svo.getRegdate().substring(0,10));
		
		sSrv.setSale(svo);
		
		StockVO stvo = new StockVO();
		stvo.setItemcd(svo.getItemcd());
		stvo.setOutdt(svo.getSaledt());
		stvo.setOutqty(svo.getQty());
		stvo.setInsert_person(name);
		stvo.setOrdnum(svo.getOrdnum());
		
		sSrv.updateYN(svo.getOrdnum());
		
		sSrv.setStockInfo(stvo);	
		return "redirect:/SFA_sale_manage";
	}
	
	@RequestMapping("updateSaleInfo")
	@ResponseBody
	public String updateSaleInfo(@ModelAttribute SaleVO svo) {	
		String msg = "";
		
		if(svo != null) {
			sSrv.updateSaleInfo(svo);
			StockVO stvo = new StockVO();
			
			stvo.setOrdnum(svo.getOrdnum());
			stvo.setOutdt(svo.getSaledt());
			stvo.setOutqty(svo.getQty());
			sSrv.updateStock(stvo);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("deleteSaleInfo")
	@ResponseBody
	public String deleteSaleInfo(@RequestParam String salenum) {	
		String msg = "";
		SaleVO svo = new SaleVO();
		if(salenum != null) {		
			svo = sSrv.getOneSale(salenum);
			sSrv.deleteStock(svo.getOrdnum()); 	
			
			sSrv.deleteSaleInfo(salenum);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("/saleDeleteAll")
	@ResponseBody
	public String saleDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr){
		
		String msg = "";
		SaleVO svo = new SaleVO();
		if(chkArr != null) {
			
			for(String salenum : chkArr) { 			
				svo = sSrv.getOneSale(salenum);
				sSrv.deleteStock(svo.getOrdnum());
				
				sSrv.deleteSaleInfo(salenum);
			}
			msg="success";
			
		}else msg="fail";
		
		return msg;
	}
}
