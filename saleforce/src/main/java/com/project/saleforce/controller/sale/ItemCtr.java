package com.project.saleforce.controller.sale;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ItemVO;
import com.project.saleforce.model.StockVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.ComcodeSrv;
import com.project.saleforce.service.ItemSrv;
import com.project.saleforce.service.MainSrv;

@Controller
public class ItemCtr {
	
	@Resource(name="uploadPath")
	private String uploadPath = "C:/upload";

	@Autowired
	ItemSrv iSrv;
	
	@Autowired
	ComcodeSrv cSrv;
	
	@Autowired
	MainSrv mSrv;
	
	@RequestMapping("SFA_item_manage")
	public ModelAndView getItemList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "itemcd") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();	
		int count = iSrv.getItemCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<ItemVO> list = iSrv.getItemList(start, end, searchOpt, words);
		
		mav.addObject("com", mSrv.getCompanyInfo());
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

	@RequestMapping(value = "insert_item", method = RequestMethod.POST) 
	public String setItem(@ModelAttribute ItemVO ivo, @RequestPart MultipartFile file, HttpServletRequest request) throws IOException {
		StockVO svo = new StockVO(); 
		
		String div = ivo.getItemdiv();
		String grp = ivo.getItemgrp();
		String name = ivo.getInsert_person();
		String date = ivo.getRegdate().substring(0,4) + ivo.getRegdate().substring(5,7);
		String itemcd = div + grp + date;
		
		ivo.setInsert_person(name);
		ivo.setItemcd(itemcd);
		ivo.setRegdate(ivo.getRegdate().substring(5,7));
		
		UUID uuid = UUID.randomUUID();
		
		if(file.getOriginalFilename() != "") {
			String orgFileName = uuid.toString() + "_" + file.getOriginalFilename();
			String root_path = request.getSession().getServletContext().getRealPath("/WEB-INF/");
			String attach_path = "images/upload/item/";
			
			File location2 = new File(root_path + attach_path, orgFileName);
			FileCopyUtils.copy(file.getBytes(), location2);
			
			
			/*
			 * File location = new File(uploadPath, orgFileName);
			 * FileCopyUtils.copy(file.getBytes(), location);
			 */
			
			ivo.setPhotoName(file.getOriginalFilename());
			ivo.setItemPhoto(orgFileName);
			
			svo.setItemPhoto(orgFileName);
		}
		
		  
		iSrv.setItem(ivo);

		
		svo.setItemcd(ivo.getItemcd() + ivo.getSeq());
		svo.setItemnm(ivo.getItemnm()); 
		svo.setStd(ivo.getStd()); 
		iSrv.setStock(svo);		 
		
		return "redirect:/SFA_item_manage";
	}	
	
	@RequestMapping("/getOneItem")
	@ResponseBody
	public ItemVO getOneItem(@RequestParam String itemcd){
		return iSrv.getOneItem(itemcd);
	}
	
	@RequestMapping("/updateItemInfo")
	@ResponseBody
	public String updateItemInfo(@ModelAttribute ItemVO ivo, @RequestPart MultipartFile file, HttpServletRequest request) throws IOException{
		String msg = "";
		
		if(ivo != null) {
			UUID uuid = UUID.randomUUID();
			
			if(file.getOriginalFilename() != "") {
				String orgFileName = uuid.toString() + "_" + file.getOriginalFilename();
				String root_path = request.getSession().getServletContext().getRealPath("/WEB-INF/");
				String attach_path = "images/upload/item/";
				
				File location2 = new File(root_path + attach_path, orgFileName);
				FileCopyUtils.copy(file.getBytes(), location2);
				
				/*
				 * File location = new File(uploadPath, orgFileName);
				 * FileCopyUtils.copy(file.getBytes(), location);
				 */
				
				ivo.setPhotoName(file.getOriginalFilename());
				ivo.setItemPhoto(orgFileName);
				
				iSrv.updateItemInfo(ivo);
				iSrv.updateImgup(ivo);
			}else {
				iSrv.updateItemInfoNo(ivo);
				iSrv.updateStd(ivo);
			}									
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
