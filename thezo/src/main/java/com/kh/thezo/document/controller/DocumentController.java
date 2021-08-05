package com.kh.thezo.document.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
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
	public String selectDocumentList(Model model, 
			@RequestParam(value="dCount", defaultValue="15") int dCount,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam(value="docCategory", defaultValue="공용") String docCategory) {
		
		int listCount = dService.selectListCount(docCategory);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, dCount);
		
		ArrayList<Document> list = dService.selectDocumentList(pi, docCategory);
		
		// 카테고리 불러오기(부서명)
		//ArrayList<Department> depList = dService.selectDepartMentList();
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("dCount", dCount);
		
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
	
	/**
	 * 문서양식 삭제
	 */
	@ResponseBody
	@RequestMapping("delete.doc")
	public String deleteDocument(@RequestParam(value="arr[]") int[] arr, Model model) {
		int result = dService.deleteDocument(arr);
		return result > 0 ? "success" : "fail";
	}
	
	
	/**
	 * 글 조회하기
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="select.doc")
	public void selectDocument(@RequestParam(value="arr[]") int[] arr, HttpServletResponse response) throws IOException {
		Document d = dService.selectDocument(arr[0]);
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(d);
		response.getWriter().print(result);
	}
	
	/**
	 * 문서양식 수정
	 */
	@RequestMapping("update.doc")
	public String updateDocument(Document d, MultipartFile reupfile, HttpSession session) {
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(d.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(d.getChangeName())).delete();
			}
			// 새로 넘어온 첨부파일 서버에 업로드
			String changeName = saveFile(session, reupfile);
			d.setOriginName(reupfile.getOriginalFilename());
			d.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = dService.updateDocument(d);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정되었습니다.");
			return "redirect:list.doc";
		}else {
			session.setAttribute("alertMsg", "수정을 실패했습니다. 다시 시도해주세요.");
			return "redirect:list.doc";
		}
	}
	
	
	/**
	 *  문서 검색 기능
	 */
	@RequestMapping("search.doc")
	public String searchDocument(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			String condition, String keyword, Model model, 
			@RequestParam(value="dCount", defaultValue="15") int dCount,
			@RequestParam(value="docCategory", defaultValue="공용") String docCategory) {
		HashMap map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("docCategory", docCategory);
		int listCount = dService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, dCount);
		
		ArrayList<Document> list = dService.searchDocumentList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("dCount", dCount);
		
		return "document/documentListView";
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
