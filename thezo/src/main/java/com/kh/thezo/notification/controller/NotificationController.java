package com.kh.thezo.notification.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.notification.model.service.NotificationService;
import com.kh.thezo.notification.model.vo.Notification;

@Controller
public class NotificationController {
	
	@Autowired
	private NotificationService nfService;

	// ※ 관리자단 ! ------------------------------------------------------------------------------------------------------------------------------
	//	일단은 나중에 생각해서 ModelAndView로 세팅 지금은 넘기기만 하자! 
	// url 신경써서!!! 여기서는 currentPage 기본 값을 1로 설정하여 진행한다. 
	
	/** 페이징 처리 + 관리자단 알림 부분 조회용 controller
	 * @author Jaewon.s
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("list.adnf")
	public ModelAndView SelectAndViewNotificationList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = nfService.selectListCount();		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Notification> list = nfService.SelectAndViewNotificationList(pi);
		mv.addObject("subPage", "2").addObject("pi",pi).addObject("list",list).setViewName("notification/adminNotificationListView");
		return mv;
	}
		
	/** 관리자단에서 알림 등록 controller
	 * @author Jaewon.s
	 * @param nf 알림등록시 사용자가 입력한 값을 받는 인자
	 * @param session 
	 * @param mv
	 * @return
	 */
	@RequestMapping("insert.adnf")
	public ModelAndView insertNotification(Notification nf, HttpSession session, ModelAndView mv) {		
		int result = nfService.insertNotification(nf);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 알림을 등록하였습니다");
			mv.setViewName("redirect:list.adnf");
		}else {
			mv.addObject("errorMsg", "알림등록 실패 <br> 기존에 동일한 부서, 시작일, 종료일, 알림내용의 <br> 알림이 존재 할 수 있습니다. <br> 확인해주세요").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** 하나의 알림 정보만을 가져오는 AJAX 
	 * @param nfNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="ajaxSelectOne.adnf", produces="application/json; charset=utf-8")
	public String selectNotification(int nfNo) {
		Notification nf = nfService.selectNotification(nfNo);
		return new Gson().toJson(nf);
	}

	/** 선택한 알림을 삭제처리 (del_status 변경형식) Controller
	 * @param nfNo  (del_status를 바뀌기 위한 인자값)
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("delete.adnf")
	public ModelAndView deleteNotification(int nfNo, HttpSession session, ModelAndView mv) {		
		int result = nfService.deleteNotification(nfNo);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 알림을 삭제하였습니다");
			mv.setViewName("redirect:list.adnf");
		}else {
			mv.addObject("errorMsg", "알림삭제에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** 사용자의 선택 사항에 따라서 달라지는 서비스로 기존 알림을 업데이트 할떄의 Controller
	 * @param nf (새로이 담긴 알림 내용 (nfNo는 무조건 동일)
	 * @param originNdDeptName (서비스단으로 넘기는 값으로 새로 수정된 알림과 기존의 알림의 부서가 다를경우 조건검사용)
	 * @param reNotify (서비스단으로 넘기는 값으로 다시 해당알림 nf_check테이블에서 읽음 표시 업데이트처리용  )
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("update.adnf")
	public ModelAndView updateNotification(Notification nf, String originNdDeptName, String reNotify, HttpSession session, ModelAndView mv) {		
		// controller에서는 오직 사용자(브라우저에) 어떤걸 띄워줄지에 대해서만 집중을 해보자 
		// 비즈니스 로직 처리는 service단에서 처리를 하도록! 		
		int result = nfService.updateNotification(nf, originNdDeptName, reNotify);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 알림을 수정하였습니다");
			mv.setViewName("redirect:list.adnf");
		}else {
			mv.addObject("errorMsg", "알림수정 실패 <br> 에러원인은 사용자의 달라진 요청으로 인한 <br> 로직처리중 발생할 가능성이 높음").setViewName("common/errorPage");
		}
		return mv;
	}

	//-----------------------사용자단 관련 !! ----------------------------------------
	//★ ↓ AJAX 처리다!! 
	/*
	@ResponseBody
	@RequestMapping(value="confirm.nf", produces="application/json; charset=utf-8")
	public String ajaxConfirmNotification(HttpSession session) {
	*/

		//int result = 어떤 메소드 실행해서 !!! 알림 읽음으로 update처리하고 
		//session에서 !!! 알림쪽! 만료 시켜줘야한다!!! 
		//if(result>0) {
		//	session.removeAttribute("notification");
		//}

		//if(result>0) {//알림 읽음으로 update성공시 
		//	return "1";
		//}else {//실패시 
		//	retunr "0";
		//}
	//}

	

}
