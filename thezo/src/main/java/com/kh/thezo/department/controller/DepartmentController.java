package com.kh.thezo.department.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.thezo.department.model.service.DepartmentService;
import com.kh.thezo.department.model.vo.Department;

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService dService;
	
	//부서 등록
	@RequestMapping("deptAdd.dept")
	public String insertDept(Department d, Model model, HttpSession session) {
		int result = dService.insertDept(d);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 부서등록 되었습니다");
			return "redirect:adminDept.ma";
		}else {
			model.addAttribute("errorMsg", "부서등록 실패");
			return "common/errorPage";
		}
	}
	
	//부서코드 중복조회
	@PostMapping("noCheck.dep")
	@ResponseBody
	public int depNocheck(@RequestParam("depNo") String depNo) {
		int checkNo = dService.depNocheck(depNo);
		return checkNo;
	}
	
	@RequestMapping("deptModi.dept")
	public String updateDept(Department d, Model model, HttpSession session) {
		int result = dService.updateDept(d);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:adminDept.ma";
		}else {
			model.addAttribute("errorMsg", "부서수정 실패");
			return "common/errorPage";
		}
	}
}
