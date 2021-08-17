package com.kh.thezo.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.approval.model.service.ApprovalService;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.mail.model.vo.Attachment;
//@author YI
import com.kh.thezo.member.model.vo.Member;


@Controller
public class ApprovalController {
	
	
	@Autowired
	private ApprovalService aService;
	
	

	//전자결재 메인페이지로 관련있는 결재리스트 불러오기
	@RequestMapping("main.appr")
	public ModelAndView selectApprovalMain(ModelAndView mv,
			@RequestParam(value = "apprFolder", defaultValue = "main") String apprFolder, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			String datePeriod, Approval a, @RequestParam(value = "searchType", defaultValue = "user")String searchType) {
		
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			session.setAttribute("apprRead", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			// 페이징 확인
			a.setStatus("");
			a.setMemNo(m.getMemNo());
			a.setApprFolder(apprFolder);

			if (a.getDocName() != null && a.getDocName().equals("")) {
				a.setDocName(null);
			}

			if (datePeriod != null && !datePeriod.equals("")) {
				String calStartDate = datePeriod.substring(0, 10);
				String calEndDate;
				if (datePeriod.length() < 22) {
					calEndDate = calStartDate;
				} else {
					calEndDate = datePeriod.substring(13, 23);
				}
				a.setSearchSDate(calStartDate);
				a.setSearchEDate(calEndDate);
			}
			// 관리자페이지에서 접속한경우 관리자 모드 메소드로 이동
			if (searchType.equals("admin")) {
				mv = adminAllList(mv, a, currentPage, apprFolder, m.getStatus());
			} else {

				int listCount = aService.selectListCount(a);
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
				ArrayList<Approval> list = aService.selectApprovalMain(a, pi);
				ArrayList<ApprovalAccept> readCheckList = aService.selectApprovalRead(a);
				mv.addObject("list", list).addObject("search", a).addObject("readCheckList", readCheckList)
						.addObject("pi", pi).addObject("apprFolder", apprFolder).setViewName("approval/approvalMain");

			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 문서양식 리스트 불러오기
	@RequestMapping("new.appr")
	public ModelAndView newApprList(HttpSession session,Approval a,ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			int listCount = aService.newApprListCount(a);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.newApprList(a, pi);
			mv.addObject("list", list).addObject("pi", pi).setViewName("approval/approvalNew");
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 문서 작성하는 페이지 
	@RequestMapping("enrollForm.appr")
	public ModelAndView enrollApproval(ModelAndView mv, HttpSession session, int ano) {
		Approval aTemp = new Approval();
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			aTemp.setMemNo(m.getMemNo());
			aTemp.setDepClass(m.getDepClass()); // department depNo수정
			aTemp.setFormNo(ano);
			Approval a = aService.enrollApproval(aTemp);
			ArrayList<Member> empList = aService.employeeList();
			ArrayList<ApprovalAccept> cLine = aService.selectformLineList(aTemp);
			Member leaveCount = aService.selectLeave(aTemp.getMemNo());
			mv.addObject("a", a) // 문서 포맷
					.addObject("empList", empList) // 전사원 리스트
					.addObject("cLine", cLine); // 해당 양식의 결재선

			// 연차신청인 경우 다른 페이지로 이동
			if (a.getFormNo() == 5) {
				mv.addObject("leaveCount", leaveCount) // 연차 잔여갯수
						.setViewName("approval/approvalLeaveForm");
			} else {
				mv.setViewName("approval/approvalEnrollForm");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/approval/");
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
	

	
	
	// 문서작성후 기안하기 매핑
	@RequestMapping("insertDocu.appr")
	public ModelAndView insertApprovalDocument(String tempStatus, Approval a, HttpSession session,
			MultipartFile[] upfile, ModelAndView mv) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			a.setMemNo(m.getMemNo());
			a.setStatus("대기");
			if (!upfile[0].getOriginalFilename().equals("")) {
				ArrayList<Attachment> list = new ArrayList<>();

				for (int i = 0; i < upfile.length; i++) {
					Attachment at = new Attachment();
					String changeName = saveFile(session, upfile[i]);
					at.setOriginName(upfile[i].getOriginalFilename());
					at.setFileUrl("resources/uploadFiles/approval/" + changeName);
					at.setFileLevel(i + 1);
					at.setFileType("전자결재");
					list.add(at);
				}
				a.setAt(list);
			}
			int result = aService.insertApprovalDocument(a);
			if (result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
				mv.setViewName("redirect:main.appr");
			} else {
				mv.addObject("errorMsg", "작성에 실패했습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 결재문서 상세조회 (회수/승인/반려는 반환되는 페이지에서 진행)
	@RequestMapping("detailDocu.appr")
	public ModelAndView detailApproval(int docNo, ModelAndView mv, HttpSession session
			,@RequestParam(value = "searchType", defaultValue = "user")String searchType) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			// 문서 수신자(결재자, 참조자) 문서를 읽은 경우 읽음으로 표시
			HashMap<String, Integer> hs = new HashMap<>();
			hs.put("memNo", m.getMemNo());
			hs.put("docNo", docNo);
			aService.detailReadUpdate(hs);
			Approval a = aService.detailApproval(docNo);
			ArrayList<ApprovalAccept> aLine = aService.detailApprovalLine(docNo);
			mv.addObject("a", a).addObject("aLine", aLine);
			if(searchType.equals("admin")) {
				mv.setViewName("approval/apprAdminDetail");
			}else {
				mv.setViewName("approval/apprDetailDocu");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 승인 선택시 진행되는 매핑
	@RequestMapping("approveDocu.appr")
	public ModelAndView approveDocu(int lastApprover, HttpSession session, ApprovalAccept a, String apprStatus, int formNo, ModelAndView mv) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			a.setStatus(apprStatus); // 모델앤뷰 변수와 충돌되어서 별도로 뺐음
			if (m.getMemNo() == a.getMemNo() || m.getStatus().equals("A")) {
				int result = aService.approveDocu(lastApprover, a);
				if (result > 0) { // 성공
					// 연차관련 문서였다면 추가
					if (formNo == 5) {
						result = aService.updateLeaveStatus(lastApprover, a);
					}
					session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
					mv.setViewName("redirect:detailDocu.appr?docNo=" + a.getDocNo());
				} else {
					mv.addObject("errorMsg", "승인 과정 중 에러가 발생 했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다. 로그인을 확인 해 주세요");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 반려 선택시 진행되는 매핑
	@RequestMapping("denyDocu.appr")
	public ModelAndView denyDocu(HttpSession session, ApprovalAccept a, String apprStatus, int formNo, ModelAndView mv) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			a.setStatus(apprStatus); // 모델앤뷰 변수와 충돌되어서 별도로 뺐음
			// 연자신청서를 반려하는 경우
			if (m.getMemNo() == a.getMemNo() || m.getStatus().equals("A")) {
				// lastApprover가 의미가 없어서 -1로 지정
				int result = aService.approveDocu(-1, a);
				if (result > 0) { // 성공
					// 연차관련 문서였다면 추가
					if (formNo == 5) {
						result = aService.updateLeaveStatus(-1, a);
					}
					session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
					mv.setViewName("redirect:detailDocu.appr?docNo=" + a.getDocNo());
				} else {
					mv.addObject("errorMsg", "반려 과정 중 에러가 발생 했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다. 로그인을 확인 해 주세요");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회수선택시 진행되는 매핑
		@RequestMapping("cancelDocu.appr")
		public ModelAndView cancelDocu(HttpSession session, Approval a, int formNo, ModelAndView mv) {
			Member m = (Member) session.getAttribute("loginUser");
			if (m != null) {
				if (m.getMemNo() == a.getMemNo()) {
					a.setStatus("임시");
					int result = aService.cancelDocu(a);
					if (result > 0) { // 성공
						session.setAttribute("alertMsg", "성공적으로 회수 되었습니다.");
						mv.setViewName("redirect:detailDocu.appr?docNo=" + a.getDocNo());
					} else {
						mv.addObject("errorMsg", "회수에 실패했습니다");
						mv.setViewName("common/errorPage");
					}
				} else {
					mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다. 로그인을 확인 해 주세요");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
	//관리자
	@RequestMapping("adminMain.appr") // 관리자 페이지 메인
	public ModelAndView adminMainApproval(HttpSession session, Approval a, ModelAndView mv, String apprStatus,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			if (m.getStatus().equals("A")) {
				int listCount = aService.newApprListCount(a);
				if (apprStatus != null) {
					a.setStatus(apprStatus);
				}
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
				ArrayList<Approval> list = aService.newApprList(a, pi);
				mv.addObject("list", list).addObject("pi", pi).setViewName("approval/apprAdmin");
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("editForm.appr")  //관리자 페이지에서 양식 수정 매핑
	public ModelAndView adminEditFormApproval(ModelAndView mv, HttpSession session, int formNo) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			if (m.getStatus().equals("A")) {
				if (formNo != 0) {
					Approval aTemp = new Approval();
					aTemp.setFormNo(formNo);
					Approval a = aService.enrollApproval(aTemp);
					mv.addObject("a", a); // 문서 포맷
					mv.setViewName("approval/apprAdminEditForm");
				} else {
					mv.setViewName("approval/apprAdminEnrollForm");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("insertNewDocu.appr")  //관리자 페이지에서 신규양식 등록
	public ModelAndView insertNewDocument(ModelAndView mv, HttpSession session, Approval a, String usingStatus) {
		a.setStatus(usingStatus);
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			if (m.getStatus().equals("A")) {
				int result = aService.insertNewDocument(a);
				if (result > 0) { // 성공
					session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
					mv.setViewName("redirect:adminMain.appr");
				} else {
					mv.addObject("errorMsg", "등록에 실패했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("editNewDocu.appr") // 관리자 페이지에서 신규양식 등록
	public ModelAndView editNewDocument(ModelAndView mv, HttpSession session, Approval a, String usingStatus) {
		a.setStatus(usingStatus);
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			if (m.getStatus().equals("A")) {
				int result = aService.editNewDocument(a);

				if (result > 0) { // 성공
					session.setAttribute("alertMsg", "성공적으로 수정 되었습니다.");
					mv.setViewName("redirect:adminMain.appr");
				} else {
					mv.addObject("errorMsg", "수정에 실패했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("deleteForm.appr") // 관리자 페이지에서 신규양식 등록
	public ModelAndView deleteForm(ModelAndView mv, HttpSession session, int formNo) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			if (m.getStatus().equals("A")) {
				int result = aService.deleteForm(formNo);

				if (result > 0) { // 성공
					session.setAttribute("alertMsg", "성공적으로 삭제 되었습니다.");
					mv.setViewName("redirect:adminMain.appr");
				} else {
					mv.addObject("errorMsg", "삭제에 실패했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	public ModelAndView adminAllList(ModelAndView mv, Approval a, int currentPage, String apprFolder,
			String loginStatus) {
		if(apprFolder.equals("main")) {
			a.setStatus("%");
		}else {
			a.setStatus(apprFolder);
		}
		if (loginStatus.equals("A")) {
			int listCount = aService.adminAllListCount(a);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.adminAllList(a, pi);
			ArrayList<ApprovalAccept> readCheckList = aService.selectApprovalRead(a);
			mv.addObject("list", list).addObject("search", a).addObject("readCheckList", readCheckList)
					.addObject("pi", pi).addObject("apprFolder", apprFolder).setViewName("approval/apprAdminList");
		} else {
			mv.addObject("errorMsg", "잘못된 경로로 접근하셨습니다");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
	

	