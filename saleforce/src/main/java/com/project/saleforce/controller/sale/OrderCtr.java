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

import com.project.saleforce.model.OrderVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.OrderSrv;

@Controller
public class OrderCtr {
	
	@Autowired
	OrderSrv oSrv;

	@RequestMapping("SFA_order_manage")
	public ModelAndView getOrderList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "ordnum") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = oSrv.getOrderCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<OrderVO> list = oSrv.getOrderList(start, end, searchOpt, words);
		
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
		
		mav.setViewName("sale/SFA_order_manage");
		return mav;
	}
	
	@RequestMapping(value = "/getOneOrder")
	@ResponseBody
	public OrderVO getOneOrder(@RequestParam String ordnum) {			
		return oSrv.getOneOrder(ordnum);
	}
		
	@RequestMapping(value = "/getItemInf")
	@ResponseBody
	public OrderVO getItemInf(@RequestParam String itemcd) {			
		return oSrv.getItemInf(itemcd);
	}
	
	@RequestMapping(value = "/getCompanynm", produces = "application/text; charset=utf8")
	public @ResponseBody String getCompanynm(@RequestParam String comcd) {
		String msg = oSrv.getCompanynm(comcd);	
		
		if(msg == null) msg = "zero"; 
		return msg;
	}

	@RequestMapping(value = "setOrder", method = RequestMethod.POST) 
	public String setOrder(@ModelAttribute OrderVO ovo) {
		String name = ovo.getInsert_person();
		String date = ovo.getRegdate().substring(0,4) + ovo.getRegdate().substring(5,7) + ovo.getRegdate().substring(8,10);
		String ordnum = date;
		
		ovo.setInsert_person(name);
		ovo.setOrdnum(ordnum);
		ovo.setRegdate(ovo.getRegdate().substring(0,10));
		
		oSrv.setOrder(ovo);
		
		return "redirect:/SFA_order_manage";
	}
	
	@RequestMapping(value = "/updateOrderInfo")
	@ResponseBody
	public String updateOrderInfo(@ModelAttribute OrderVO ovo) {	
		String msg = "";
		
		if(ovo != null) {
			oSrv.updateOrderInfo(ovo);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping(value = "/deleteOrderInfo")
	@ResponseBody
	public String deleteOrderInfo(@RequestParam String ordnum) {	
		String msg = "";
		
		if(ordnum != null) {
			oSrv.deleteOrderInfo(ordnum);
			msg = "success";
		}else msg = "fail";
		
		return msg;
	}
	
	@RequestMapping("/orderDeleteAll")
	@ResponseBody
	public String orderDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr){
		
		String msg = "";
		if(chkArr != null) {
			
			for(String ordnum : chkArr ) { 
				oSrv.deleteOrderInfo(ordnum);
			}
			msg="success";
			
		}else msg="fail";
		
		return msg;
	}

}
