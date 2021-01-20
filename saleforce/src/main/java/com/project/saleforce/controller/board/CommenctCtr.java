package com.project.saleforce.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.saleforce.model.CommentVO;
import com.project.saleforce.service.CommentSrv;

@Controller
public class CommenctCtr {

	@Autowired
	CommentSrv cSrv;

	@RequestMapping("/comment_register")
	@ResponseBody
	public void setComment(@ModelAttribute CommentVO cvo) {
		cSrv.setComment(cvo);
	}
	
	@RequestMapping("/comment_list")
	@ResponseBody
	public Map<String, Object> getCommentList(@ModelAttribute CommentVO cvo) {		
		List<CommentVO> list = cSrv.getCommentList(cvo); 
		int count = cSrv.getCommentCount(cvo); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping("/comment_delete")
	@ResponseBody
	public void setDelete(@ModelAttribute CommentVO cvo) {
		cSrv.setCommentDelete(cvo);
	}
	
	@RequestMapping("/comment_modify")
	@ResponseBody
	public void setModify(@ModelAttribute CommentVO cvo) {
		cSrv.setCommentModify(cvo);
	}
}
