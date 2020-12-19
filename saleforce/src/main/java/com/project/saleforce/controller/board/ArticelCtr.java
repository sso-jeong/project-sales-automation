package com.project.saleforce.controller.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.ArticleVO;
import com.project.saleforce.model.BoardVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.ArticleSrv;

@Controller
public class ArticelCtr {
	
	@Autowired
	ArticleSrv artSrv;
	
	@RequestMapping("SFA_notice_list")
	public ModelAndView getArticleList(@RequestParam(defaultValue = "1") int curPage,@RequestParam(defaultValue = "subject") String searchOpt, @RequestParam(defaultValue = "") String words,  @RequestParam String boardCode) {
		int count = artSrv.getArticleCount(searchOpt, words, boardCode);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		BoardVO bvo = artSrv.getBoardOne(boardCode);
		List<ArticleVO> list = artSrv.getArticleList(start, end, searchOpt, words, boardCode);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
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
		mav.addObject("totalPage", pager.getTotPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("selected", pager.getCurPage());
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		mav.addObject("boardMaker", bvo.getBoardMaker());
		
		mav.setViewName("notice/SFA_notice_list");
		return mav;
	}
	
	@RequestMapping(value = "/SFA_notice_insert", method = RequestMethod.GET)
	public ModelAndView getArticleInsert(@RequestParam String boardCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardCode", boardCode);
		
		BoardVO bvo = artSrv.getBoardOne(boardCode);
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		mav.addObject("boardWrite", bvo.getBoardWrite());
		
		mav.setViewName("notice/SFA_notice_insert");
		return mav;
	}
	
	
	  @RequestMapping(value = "/SFA_notice_insert", method=RequestMethod.POST)
	  public String setArticleDo(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		  if (files.isEmpty()) { 
			  artSrv.setArticle(avo);
		  } else { 
			  String fileName = files.getOriginalFilename(); 
			  String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
			  File destinationFile; 
			  String destinationFileName; 
			  String fileUrl = "c://upload//fileUpload//";
		  
		  do { destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
		  		destinationFile = new File(fileUrl + destinationFileName);
		  } while (destinationFile.exists());
		  
		  destinationFile.getParentFile().mkdirs(); 
		  files.transferTo(destinationFile);
		  
		  avo.setFileName(destinationFileName); 
		  avo.setFileOriName(fileName);
		  avo.setFileUrl(fileUrl); 
		  artSrv.setArticle(avo); 
		  }
		  
		  return "redirect:/SFA_notice_list?boardCode="+avo.getBoardCode(); 
	  }
	  
  		@RequestMapping(value = "/SFA_notice_modify", method = RequestMethod.GET)
	  		public ModelAndView getArticleModify(@ModelAttribute ArticleVO vo) {
			ArticleVO avo = artSrv.getArticleOne(vo);
			BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("modArticle", avo);
			mav.addObject("boardColor", bvo.getBoardColor());
			mav.addObject("boardTitle", bvo.getBoardTitle());
			mav.addObject("boardCode", vo.getBoardCode());
			
			mav.setViewName("notice/SFA_notice_modify");
			return mav;
  		}
	  
	  @RequestMapping(value = "/SFA_notice_modify", method=RequestMethod.POST)
	  public String modArticleDo(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		  if (files.isEmpty()) { 
			  artSrv.updateArticle(avo);
		  } else { 
			  String fileName = files.getOriginalFilename(); 
			  String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
			  File destinationFile; 
			  String destinationFileName; 
			  String fileUrl = "c://upload//fileUpload//";
		  
		  do { destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
		  		destinationFile = new File(fileUrl + destinationFileName);
		  } while (destinationFile.exists());
		  
		  destinationFile.getParentFile().mkdirs(); 
		  files.transferTo(destinationFile);
		  
		  avo.setFileName(destinationFileName); 
		  avo.setFileOriName(fileName);
		  avo.setFileUrl(fileUrl);
		  
		  artSrv.updateArticle(avo); 
		  }
	  
		  return "redirect:/SFA_notice_list?boardCode="+avo.getBoardCode(); 
	  }
	  
	  
	  	@RequestMapping(value = "/SFA_notice_view", method = RequestMethod.GET)
	  	public ModelAndView getArticleView(@ModelAttribute ArticleVO vo) {
			ArticleVO avo = artSrv.getArticleOne(vo);
			BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
			ModelAndView mav = new ModelAndView();
			artSrv.hitUp(vo);
			mav.addObject("article", avo);
			
			mav.addObject("boardCode", vo.getBoardCode());
			mav.addObject("boardMaker", bvo.getBoardMaker());
			mav.addObject("boardTitle", bvo.getBoardTitle());
			mav.addObject("boardRead", bvo.getBoardRead());
			mav.addObject("boardDownload", bvo.getBoardDownload());

			mav.setViewName("notice/SFA_notice_view");
			
			return mav;
	  	}
	  	
	  	@RequestMapping(value = "/SFA_notice_reply", method = RequestMethod.GET)
		public ModelAndView getArticleReply(@ModelAttribute ArticleVO vo) {
			ArticleVO avo = artSrv.getArticleOne(vo);
			BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
			
			ModelAndView mav = new ModelAndView();
			
			if( avo != null ) {
				mav.addObject("replyArticle", avo);
				mav.addObject("boardCode", vo.getBoardCode());
				mav.addObject("boardTitle", bvo.getBoardTitle());
				mav.addObject("boardColor", bvo.getBoardColor());
				mav.addObject("boardReply", bvo.getBoardReply());
				
				mav.setViewName("notice/SFA_notice_reply");
			}

			return mav;
		}
		
		
		@RequestMapping(value = "/SFA_notice_reply", method=RequestMethod.POST)
		public String setArticleReply(
				@ModelAttribute ArticleVO vo,
				@RequestPart MultipartFile files) throws Exception {
			
			
			if (files.isEmpty()) { 
				artSrv.setArticleReply(vo);
				
			} else {
				String fileName = files.getOriginalFilename();
				String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
				File destinationFile;
				String destinationFileName;
				String fileUrl = "c://upload//fileUpload//";

				do {
					destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
					destinationFile = new File(fileUrl + destinationFileName);
				} while (destinationFile.exists());

					destinationFile.getParentFile().mkdirs();
					files.transferTo(destinationFile);
		
					vo.setFileName(destinationFileName);
					vo.setFileOriName(fileName);
					vo.setFileUrl(fileUrl);
					artSrv.setArticleReply(vo);
			}
			
			return "redirect:/SFA_notice_list?boardCode="+vo.getBoardCode();
		}
	  
	  @RequestMapping("/SFA_notice_delete")
	  @ResponseBody
	  public String setArtcileDelete(@RequestParam String aid, @RequestParam String boardCode) {
		  	ArticleVO vo = new ArticleVO();
		  	int aidt = Integer.parseInt(aid);
		  	vo.setAid(aidt);
		  	vo.setBoardCode(boardCode);
		  	
			ArticleVO avo = artSrv.getArticleOne(vo);
			if( avo.getFileName() != null ) {
				String fileUrl = "c://upload//fileUpload//";
				File file = new File(fileUrl + avo.getFileName());
				if( file.exists() ) {
					file.delete();
				}
			}
			 
			artSrv.setArticleDelete(aidt, boardCode);
			return "succees";
	  }
	  
	  @RequestMapping(value = "/SFA_notice_download", method = RequestMethod.GET)
	  public void fileDown(
				@ModelAttribute ArticleVO avo,
				HttpServletRequest request, 
				HttpServletResponse response)
				throws Exception {

			request.setCharacterEncoding("UTF-8");
			ArticleVO vo = artSrv.getArticleOne(avo);


			try {
				String fileUrl = vo.getFileUrl();
				fileUrl += "/";
				String savePath = fileUrl;
				String fileName = vo.getFileName();


				String oriFileName = vo.getFileOriName();
				InputStream in = null;
				OutputStream os = null;
				File file = null;
				boolean skip = false;
				String client = "";


				try {
					file = new File(savePath, fileName);
					in = new FileInputStream(file);
				} catch (FileNotFoundException fe) {
					skip = true;
				}

				client = request.getHeader("User-Agent");


				response.reset();
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Description", "JSP Generated Data");

				if (!skip) {
					
					if (client.indexOf("MSIE") != -1) {
						response.setHeader("Content-Disposition", "attachment; filename=\""
								+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
						
					} else if (client.indexOf("Trident") != -1) {
						response.setHeader("Content-Disposition", "attachment; filename=\""
								+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					} else {
						
						response.setHeader("Content-Disposition",
								"attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
						response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
					}
					response.setHeader("Content-Length", "" + file.length());
					os = response.getOutputStream();
					byte b[] = new byte[(int) file.length()];
					int leng = 0;
					while ((leng = in.read(b)) > 0) {
						os.write(b, 0, leng);
					}
				} else {
					response.setContentType("text/html;charset=UTF-8");
					System.out.println("<script language='javascript'>alert('�뙆�씪�쓣 李얠쓣 �닔 �뾾�뒿�땲�떎');history.back();</script>");
				}
				in.close();
				os.close();
			} catch (Exception e) {
				System.out.println("ERROR : " + e.getMessage());
			}

		}
	  
	  	@RequestMapping(value = "/SFA_notice_delete_all", method = RequestMethod.POST)
		@ResponseBody
		public String setArticleDeleteAll(@ModelAttribute ArticleVO vo, @RequestParam(value = "chkArr[]") List<String> chkArr) {
			
			int aid;
			
			String fileUrl = "c://upload//fileUpload//";
			File files = null;
			for(String list : chkArr) {
				aid = Integer.parseInt(list);
				vo.setAid(aid);
				vo.setBoardCode(vo.getBoardCode());
				
				ArticleVO avo = artSrv.getArticleOne(vo);
				files = new File(fileUrl + avo.getFileName());
				if( files.exists() ) {
					files.delete();
				}
				artSrv.setArticleDelete(aid, vo.getBoardCode());
			}
			
			return "success";
		}
	 
}
