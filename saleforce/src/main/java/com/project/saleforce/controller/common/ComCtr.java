package com.project.saleforce.controller.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.saleforce.model.ComcodeVO;
import com.project.saleforce.service.ComcodeSrv;

@Controller
public class ComCtr {
	
	@Autowired
	ComcodeSrv cSrv;
	
	// ######### 영업관리 Ctr #########
	@RequestMapping("/getGrpList")
	@ResponseBody
	public List<ComcodeVO> getGrpList() {
		List<ComcodeVO> list = cSrv.getGrpList();
		return list;
	}
	
	@RequestMapping("/getDivList")
	@ResponseBody
	public List<ComcodeVO> getDivList() {
		List<ComcodeVO> list = cSrv.getDivList();
		return list;
	}
	
	@RequestMapping("/getTypeList")
	@ResponseBody
	public List<ComcodeVO> getTypeList() {
		List<ComcodeVO> list = cSrv.getTypeList();
		return list;
	}
	
	@RequestMapping("/getDttypeList")
	@ResponseBody
	public List<ComcodeVO> getDttypeList() {
		List<ComcodeVO> list = cSrv.getDttypeList();
		return list;
	}	
	
	@RequestMapping("/getStktypeList")
	@ResponseBody
	public List<ComcodeVO> getStktypeList() {
		List<ComcodeVO> list = cSrv.getStktypeList();
		return list;
	}	

	// ######### 인사관리 Ctr  #########
	@RequestMapping("/getGenderList")
	@ResponseBody
	public List<ComcodeVO> getGenderList() {
		List<ComcodeVO> list = cSrv.getGenderList();
		return list;
	}
	
	@RequestMapping("/getbirthtype")
	@ResponseBody
	public List<ComcodeVO> getbirthtype() {
		List<ComcodeVO> list = cSrv.getbirthtype();
		return list;
	}
	
	@RequestMapping("/getChaList")
	@ResponseBody
	public List<ComcodeVO> getChaList() {
		List<ComcodeVO> list = cSrv.getChaList();
		return list;
	}
	
	@RequestMapping("/getMiliList")
	@ResponseBody
	public List<ComcodeVO> getMiliList() {
		List<ComcodeVO> list = cSrv.getMiliList();
		return list;
	}
	
	@RequestMapping("/getImpList")
	@ResponseBody
	public List<ComcodeVO> getImpList() {
		List<ComcodeVO> list = cSrv.getImpList();
		return list;
	}
	
	@RequestMapping("/getPatrList")
	@ResponseBody
	public List<ComcodeVO> getPatrList() {
		List<ComcodeVO> list = cSrv.getPatrList();
		return list;
	}
	
	@RequestMapping("/getReliList")
	@ResponseBody
	public List<ComcodeVO> getReliList() {
		List<ComcodeVO> list = cSrv.getReliList();
		return list;
	}
	
	@RequestMapping("/getMarList")
	@ResponseBody
	public List<ComcodeVO> getMarList() {
		List<ComcodeVO> list = cSrv.getMarList();
		return list;
	}
	
	// ######### 근태 급여 Ctr  #########
	
	@RequestMapping("/getDlList")
	@ResponseBody
	public List<ComcodeVO> getDlList() {
		List<ComcodeVO> list = cSrv.getDlList();
		return list;
	}
	
	@RequestMapping("/getHuList")
	@ResponseBody
	public List<ComcodeVO> getHuList() {
		List<ComcodeVO> list = cSrv.getHuList();
		return list;
	}
	
	@RequestMapping("/getPayList")
	@ResponseBody
	public List<ComcodeVO> getPayList() {
		List<ComcodeVO> list = cSrv.getPayList();
		return list;
	}
	
	@RequestMapping("/getCaList")
	@ResponseBody
	public List<ComcodeVO> getCaList() {
		List<ComcodeVO> list = cSrv.getCaList();
		return list;
	}

	
	@RequestMapping("/getDatgrpList")
	@ResponseBody
	public List<ComcodeVO> getDatgrpList() {
		List<ComcodeVO> list = cSrv.getDatgrpList();
		return list;
	}

	@RequestMapping("/getAprformList")
	@ResponseBody
	public List<ComcodeVO> getAprformList() {
		List<ComcodeVO> list = cSrv.getAprformList();
		return list;
	}

	@RequestMapping("/getAprcaList")
	@ResponseBody
	public List<ComcodeVO> getAprcaList() {
		List<ComcodeVO> list = cSrv.getAprcaList();
		return list;
	}

	@RequestMapping("/getAprsingList")
	@ResponseBody
	public List<ComcodeVO> getAprsingList() {
		List<ComcodeVO> list = cSrv.getAprsingList();
		return list;
	}

	@RequestMapping("/getReasonList")
	@ResponseBody
	public List<ComcodeVO> getReasonList() {
		List<ComcodeVO> list = cSrv.getReasonList();
		return list;
	}
	
	@RequestMapping("/getNoticeList")
	@ResponseBody
	public List<ComcodeVO> getNoticeList() {	
		List<ComcodeVO> list = cSrv.getNoticeList();
		return list;
	}
	@RequestMapping("/getAuthList")
	@ResponseBody
	public List<ComcodeVO> getAuthList() {
		List<ComcodeVO> list = cSrv.getAuthList();
		return list;
	}
	
	@RequestMapping("/getAllowList")
	@ResponseBody
	public List<ComcodeVO> getAllowList() {
		List<ComcodeVO> list = cSrv.getAllowList();
		return list;
	}

}
