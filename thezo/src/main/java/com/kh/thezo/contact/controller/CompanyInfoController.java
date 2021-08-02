package com.kh.thezo.contact.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.thezo.contact.model.service.CompanyInfoService;
import com.kh.thezo.contact.model.vo.CompanyInfo;

@Controller
public class CompanyInfoController {

	@Autowired
	private CompanyInfoService cService;

	@RequestMapping("insert.co")
	public String insertCompayInfo(CompanyInfo ci, MultipartFile upImg, HttpSession session) {
		
		if(!upImg.getOriginalFilename().equals("")) {
			if(ci.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(ci.getChangeName())).delete();
			}
			
			String changeName = saveFile(session, upImg);
			
			ci.setOriginName(upImg.getOriginalFilename());
			ci.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = cService.insertCompanyInfo(ci);

		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:company.info";
		}else {
			session.setAttribute("errorMsg", "등록 실패");
			return "redirect:adminCompanyInfo.st";
		}


	}

	@RequestMapping("company.info")
	public String companyInfo(CompanyInfo ci, HttpSession session) {
		CompanyInfo cInfo = cService.companyInfo(ci);
		
		session.setAttribute("cInfo", cInfo);
		System.out.println(cInfo);
		return "contact/companyInfo";
	}
	
	@RequestMapping("adminCompanyInfo.st")
	public String companyInfoManage(CompanyInfo ci, HttpSession session) {
		CompanyInfo cInfo = cService.companyInfo(ci);
		
		session.setAttribute("cInfo", cInfo);
		System.out.println(cInfo);
		return "contact/adminInfoManage";
	}

	public String saveFile(HttpSession session, MultipartFile upImg) {

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		String originName = upImg.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		try {
			upImg.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;

	}
}