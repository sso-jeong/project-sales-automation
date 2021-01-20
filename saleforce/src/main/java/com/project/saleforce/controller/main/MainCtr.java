package com.project.saleforce.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;
import com.project.saleforce.model.ComVO;
import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.model.OrderVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.BoardSrv;
import com.project.saleforce.service.CommuteSrv;
import com.project.saleforce.service.MainSrv;
import com.project.saleforce.service.OrderSrv;

@Controller
public class MainCtr {

	@Autowired
	MainSrv mainSrv;
	
	@Autowired
	OrderSrv oSrv;
	
	@Autowired
	CommuteSrv cSrv;
	
	@Autowired
	BoardSrv bSrv;

	@RequestMapping("")
	public String getMain() {
		return "main/main";
	}

	@RequestMapping("/SFA_main")
	public ModelAndView getSfaMain() {
		ModelAndView mav = new ModelAndView();
		
		List<ArticleVO> list = mainSrv.getAny();
		List<ArticleVO> slist = mainSrv.getArtSale();
		List<ArticleVO> hlist = mainSrv.getArtHuman();
		List<OrderVO> olist = oSrv.getOrderList(0, 11, "ordnum", "");
		List<CommuteManageVO> clist = cSrv.getCommuteList(0, 11, "empid", "");
		
		int anycnt = mainSrv.getAnyCnt(); 
		int scnt = mainSrv.getArtSaleCnt();
		int hcnt = mainSrv.getArtHumanCnt();
		
		ComVO cvo = mainSrv.getCompanyInfo();
		
		mav.addObject("com", cvo);
		mav.addObject("anylist", list);
		mav.addObject("salelist", slist);
		mav.addObject("humanlist", hlist);
		mav.addObject("orderlist", olist);
		mav.addObject("commutelist", clist);
		mav.addObject("anycnt", anycnt);
		mav.addObject("salecnt", scnt);
		mav.addObject("humancnt", hcnt);
		
		mav.setViewName("main/SFA_main");
		
		return mav;
	}

	@RequestMapping("/SFA_admin")
	public ModelAndView getSfaAdmin() {
		ModelAndView mav = new ModelAndView();
		
		ComVO cvo = mainSrv.getCompanyInfo();

		mav.addObject("com", cvo);
		mav.addObject("list", mainSrv.getAuthTen());
		
		mav.setViewName("main/SFA_admin");
		return mav;
	}
	
	@RequestMapping("setCompanyInfo")
	public String setCompany(ComVO cvo) {
		mainSrv.setCompanyInfo(cvo);	
		
		return "redirect:/SFA_admin";
	}
	
	@RequestMapping("/upBoard")
	public String upBoard(BoardVO bvo) {
		mainSrv.upBoard(bvo);

		return "redirect:/SFA_admin";
	}
	
	@RequestMapping("/boardPopup")
	public ModelAndView boardPopup(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "ntgrpnm") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		
		int count = bSrv.getCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = bSrv.getBoard(start, end, searchOpt, words);
		
		mav.addObject("boardlist", list);
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
		
		mav.setViewName("popup/boardpopup");
		
		return mav;
	}


	@RequestMapping(value = "setCommute", method = RequestMethod.POST)
	public String setCommute(@ModelAttribute CommuteManageVO commutevo) {		
		String date = commutevo.getRegdate().substring(2, 4) + commutevo.getRegdate().substring(5, 7) + commutevo.getRegdate().substring(8, 10);
		String empid = commutevo.getEmpid().substring(4, 10);
		
		String dlnum = date + empid;
		
		commutevo.setDlnum(dlnum); // ���¹�ȣ
		commutevo.setDlgubun(commutevo.getDlnm()); // ���±���
		commutevo.setDldate(commutevo.getRegdate().substring(0, 10)); // ��������
		
		mainSrv.setCommute(commutevo);		
		mainSrv.setCommuteInfo(commutevo);		
		mainSrv.getStrTime(commutevo);		

		return "redirect:/SFA_main";
	}

	@RequestMapping("commuLoadMain")
	@ResponseBody
	public CommuteManageVO commuLoadMain(String empid) {
		
		CommuteManageVO cvo = new CommuteManageVO();
		cvo = mainSrv.commuLoadMain(empid);

		return cvo;
	}
	
	@RequestMapping("commuteCount")
	@ResponseBody
	public CommuteManageVO commuteCount(String dlnum) {
		return mainSrv.getCount(dlnum);
	}
	
	@RequestMapping(value="/updateOfftime", method=RequestMethod.POST)
	@ResponseBody
	public String updateOfftime(CommuteManageVO cvo) {		
		cvo.setSeq(cvo.getSeq());
		
		mainSrv.updateOfftime(cvo);
		mainSrv.getEndTime(cvo);
		mainSrv.updatetottime(cvo);
		mainSrv.getTotTime(cvo);

		return cvo.getOfftime();
	}
	
	@RequestMapping(value="/dlGubunUp", method=RequestMethod.POST)
	@ResponseBody
	public String dlGubunUp(CommuteManageVO commutevo) {
		
		String dldate = commutevo.getDldate().substring(0,4) + '-' + commutevo.getDldate().substring(5,7) + '-' +commutevo.getDldate().substring(8,10);
		
		commutevo.setDldate(dldate);
		
		
		
		int count = mainSrv.commuteCnt(commutevo); // ���±⺻���̺� üũ
		int seqCnt = mainSrv.seqCnt(commutevo); // ���»����̺� üũ
		
		commutevo.setSeq(commutevo.getSeq());
		
		//����ó��
		if (count == 0) {			
			String date = commutevo.getRegdate().substring(2, 4) + commutevo.getRegdate().substring(5, 7) + commutevo.getRegdate().substring(8, 10);
			String empid = commutevo.getEmpid().substring(4, 10);			
			String dlnum = date + empid;
			
			commutevo.setDlnum(dlnum); // ���¹�ȣ
			commutevo.setDlgubun(commutevo.getDlnm()); // ���±���
			commutevo.setDldate(commutevo.getRegdate().substring(0, 10)); // ��������
			
			mainSrv.setCommute(commutevo);
			mainSrv.setCommuteInfo(commutevo);
			mainSrv.getStrTime(commutevo);		
			
		}else if(seqCnt == 1){
			mainSrv.dlGubunUp(commutevo); // ���±⺻���̺� �������� ������Ʈ
			mainSrv.getEndTime(commutevo); // ���»����̺� ���� �������� ����ð� ������Ʈ			
			mainSrv.getTotTime(commutevo);
			
			mainSrv.setCommuteInfo(commutevo); // ���»����̺� ���ο� �������� ����
			
			commutevo.setSeq(commutevo.getSeq());
			mainSrv.getStrTime(commutevo); // ���»����̺� ���ο� �������� �ð� ������Ʈ
			
		}

		return "redirect:/SFA_main";
	}

}
