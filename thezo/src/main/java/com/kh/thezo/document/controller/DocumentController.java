package com.kh.thezo.document.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.document.model.service.DocumentService;
import com.kh.thezo.document.model.vo.Document;

/**
 * 문서관리
 * @author 선영
 *
 */
@Controller
public class DocumentController {
	
	@Autowired
	private DocumentService dService;
	
	/**
	 * 문서관리 목록 창
	 * @return 문서양식 리스트
	 */
	@RequestMapping("list.doc")
	public String selectDocumentList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = dService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Document> list = dService.selectDocumentList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "document/documentListView";
	}
	
	
	/**
	 *  문서양식 등록
	 */
	@RequestMapping("insert.doc")
	public String insertDocument(Model model, Document d, MultipartFile upfile, HttpSession session) {
		// 파일 메소드 호출
		String changeName = saveFile(session, upfile);
		
		d.setOriginName(upfile.getOriginalFilename());
		d.setChangeName("resources/uploadFiles/" + changeName);
		
		int result = dService.insertDocument(d);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:list.doc";
		}else { // 등록 실패
			session.setAttribute("alertMsg", "오류가 발생했습니다.");
			return "redirect:list.doc";
		}
		
	}
	
	@RequestMapping("delete.doc")
	public String deleteDocument(Model model, int docNo, HttpSession session) {
		int result = dService.deleteDocument(docNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "해당 문서가 삭제되었습니다.");
			return ":redirect:list.doc";
		} else {
			session.setAttribute("alertMsg","오류가 발생했습니다.");
			return ":redirect:list.doc";
		}
		
		
	}
	
	
	
	
	
	
	// 파일 등록 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); // 10000 ~ 99999 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	
	
	
	
}
