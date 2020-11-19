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

import com.project.saleforce.model.ItemVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.ComcodeSrv;
import com.project.saleforce.service.ItemSrv;

@Controller
public class ItemCtr {

	@Autowired
	ItemSrv iSrv;
	
	@Autowired
	ComcodeSrv cSrv;
	
	@RequestMapping("SFA_item_manage")
	public ModelAndView getItemList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "itemcd") String searchOpt, @RequestParam(defaultValue = "") String words) {
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
		
		mav.setViewName("sale/SFA_item_manage");
		return mav;
	}

	@RequestMapping(value = "insert_item", method = RequestMethod.POST) //占쎄퐣甕곤옙 占쎈뼄占쎈뻬占쎈뻻 筌ｏ옙 占쎌넅筌롳옙
	public String setItem(@ModelAttribute ItemVO ivo) {
		String div = ivo.getItemdiv();
		String grp = ivo.getItemgrp();
		String name = ivo.getInsert_person();
		String date = ivo.getRegdate().substring(0,4) + ivo.getRegdate().substring(5,7);
		String itemcd = div + grp + date;
		
		ivo.setInsert_person(name);
		ivo.setItemcd(itemcd);
		ivo.setRegdate(ivo.getRegdate().substring(5,7));
		
		iSrv.setItem(ivo);
		
		return "redirect:/SFA_item_manage";
	}
	
	@RequestMapping("/getOneItem")
	@ResponseBody
	public ItemVO getOneItem(@RequestParam String itemcd){
		return iSrv.getOneItem(itemcd);
	}
	
	@RequestMapping("/updateItemInfo")
	@ResponseBody
	public String updateItemInfo(@ModelAttribute ItemVO ivo){
		String msg = "";
		
		if(ivo != null) {
			iSrv.updateItemInfo(ivo);
			msg="success";
		}else msg="fail";
		
		return msg;
	}
	
	
	@RequestMapping("/deleteItemInfo")
	@ResponseBody
	public String deleteItemInfo(@RequestParam String itemcd){
		String msg = "";
		if(itemcd != "") {
			iSrv.deleteItemInfo(itemcd);
			msg="success";
		}else msg="fail";
		
		return msg;
	}
	
	@RequestMapping("/item_delete_all")
	@ResponseBody
	public String itemDeleteAll(@RequestParam(value = "chkArr[]") List<String> chkArr){
		
		String msg = "";
		if(chkArr != null) {
			
			for(String itemcd : chkArr ) {
				iSrv.deleteItemInfo(itemcd);
			}
			msg="success";
			
		}else msg="fail";
		
		return msg;
	}		
}
