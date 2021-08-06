package com.kh.thezo.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

//@author YI

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.mail.model.service.MailService;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;


@Controller
public class MailController {
	
	
	@Autowired
	private MailService mmService;
	

	@RequestMapping("main.mail")
	public ModelAndView selectMailMain(ModelAndView mv,HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		Member m = (Member) session.getAttribute("loginUser");

		// 페이징 확인
		m.setMemNo(m.getMemNo());
//		mm.setApprFolder(apprFolder);
		int listCount = mmService.selectReceiveCount(m);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Mail> list = mmService.selectReceive(m, pi);
		System.out.println(list);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("mail/mailMain");
		return mv;
	}
	
	@RequestMapping("enrollForm.mail")
	public ModelAndView enrollMail(ModelAndView mv) {
		ArrayList<Member> empList = mmService.employeeList();
		mv.addObject("empList", empList) // 전사원 리스트 
		  .setViewName("mail/mailEnrollForm");
		return mv;
	}
	
	// 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("send.mail")
	public ModelAndView sendMail(ModelAndView mv, HttpSession session, MultipartFile[] upfile, Mail mm) {
		Member m = (Member) session.getAttribute("loginUser");
		mm.setMemNo(m.getMemNo());
		mm.setSender(m.getEmail());
		mm.setReceiver(String.join(",", mm.getReceiveAry()));
			if (!upfile[0].getOriginalFilename().equals("")) {
				ArrayList<Attachment> list = new ArrayList<>();
	
				for (int i = 0; i < upfile.length; i++) {
					Attachment at = new Attachment();
					String changeName = saveFile(session, upfile[i]); 
					at.setOriginName(upfile[i].getOriginalFilename());
					at.setFileUrl("resources/uploadFiles/mail/" + changeName);
					at.setFileLevel(i+1);
					list.add(at);
				}
				mm.setAt(list);
				//섬머노트 첨부를 오칼까나
			}
			System.out.println(mm);
			int result = mmService.sendMail(mm);
			if(result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 발송 되었습니다.");
				mv.setViewName("redirect:main.mail");
			}else {
				//실패하면 첨부도 지우자
				mv.addObject("errorMsg", "작성에 실패했습니다");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}

	@RequestMapping("temp.mail")
	public String selectTempMail() {
		return "mail/tempMail";
	}
	
	@RequestMapping("spam.mail")
	public String selectSpamMail() {
		return "mail/spamMail";
	}
	
	@RequestMapping("trash.mail")
	public String selectTrashMail() {
		return "mail/trashMail";
	}
	
	
	
	
}
