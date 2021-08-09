package com.kh.thezo.message.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.member.model.vo.Member;
import com.kh.thezo.message.model.service.MessageService;
import com.kh.thezo.message.model.vo.Message;
import com.kh.thezo.message.model.vo.MsgReport;

@Controller
public class MessageController {
	@Autowired
	private MessageService msgService;
	// 위는 기본 세팅 
	
	/** 관리자단 신고된 쪽지 목록 확인 페이지에 뿌려줄 값과 forward처리하는 controller 
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.adms")
	public ModelAndView selectBoard(ModelAndView mv) {
		mv.addObject("subPage", "1");
		mv.setViewName("message/adminReportedMessageListView");
		return mv;
	}

	/** 팡업창 띄우는 Controller 부모창에서 자식창으로 넘길 값은 없고 자식창에서 부모창으로 값을 넘기는 것은 작업해둠
	 * @param mv
	 * @return
	 */
	@RequestMapping("search.me")
	public ModelAndView searchMemberWidow(ModelAndView mv) {
		mv.setViewName("common/jwMemberSearch");
		return mv;
	}
	//----------------------------------------------------------------------------------------
	
	/** 받은 쪽지 list 조회해오는 Controller
	 * @param memNo
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping(value="selectReceiveList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectReceiveMsgList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectReceiveMsgList(memNo);		
	    return new Gson().toJson(list);
	}
	
	/** 보낸쪽지함 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectSentList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectSentMsgList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectSentMsgList(memNo);		
	    return new Gson().toJson(list);
	}
	
	/** 받은쪽지를 휴지통으로 보내는 Controller 보낸 쪽지도 마찬지이디 이 Controller를 바탕으로 만들면 된
	 * @param multiMsgNo
	 * @param memNo
	 * @param msgType
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="moveToRB.msg", produces="application/json; charset=utf-8")
	public String ajaxMoveToRB(int[] multiMsgNo, int memNo, String msgType) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("memNo",  memNo);
		hm.put("multiMsgNo",  multiMsgNo);
		hm.put("msgType", msgType);
		int result = msgService.ajaxMoveToRB(hm);
		if(result > 0) {
			return new Gson().toJson("해당 쪽지들을 삭제하였습니다. \n휴지통을 확인해 주세요.");			
		}else {
			return new Gson().toJson("쪽지 삭제에 실패하였습니다. 개발자에게 문의해주세요");						
		}
	}

	/** 휴지통으로 이동한(받은 쪽지) 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectRcRbList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectRcRbList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectRcRbList(memNo);		
	    return new Gson().toJson(list);
	}
	
	/** 휴지통으로 이동한(보낸 쪽지) 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectStRbList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectStRbList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectStRbList(memNo);		
	    return new Gson().toJson(list);
	}

	/** 읽지 않은 쪽지 갯수 가져오는 controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="countUnreadMsg.msg", produces="application/json; charset=utf-8")
	public String ajaxCountUnreadedMsg(int memNo){
		int count = msgService.ajaxCountUnreadedMsg(memNo);		
	    return new Gson().toJson(count);
	}

	/** message 상세 정보를 가져오는 것인데 여기서 !!! 일단은 바로 서비스단으로 넘겨서 서비스단에서 조건문으로 처리하면서 비즈니스 로직 처리한다. 
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="Detail.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectDetailMsg(int msgNo, int memNo, String msgType){
		HashMap<String, Object> hm = new HashMap<String, Object>();		
		hm.put("msgNo",  msgNo);
		hm.put("memNo",  memNo);
		hm.put("msgType",  msgType);		
		Message msgDetail = msgService.ajaxSelectDetailMsg(hm);		
	    return new Gson().toJson(msgDetail);
	}

	
	/** 휴지통에서 받은,보낸 쪽지함으로 복구 시키는 controller
	 * @param rcMultiMsgNo
	 * @param stMultiMsgNo
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="restoreToRcSt.msg", produces="application/json; charset=utf-8")
	public String ajaxRestoreToRcSt(int[] rcMultiMsgNo, int[] stMultiMsgNo, int memNo) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("rcMultiMsgNo",  rcMultiMsgNo);
		hm.put("stMultiMsgNo",  stMultiMsgNo);
		hm.put("memNo", memNo);
		int result = msgService.ajaxRestoreToRcSt(hm);
		if(result > 0) {
			return new Gson().toJson("해당 쪽지들 정상적으로 복구하였습니다.. \n쪽지함을 확인해 주세요.");			
		}else {
			return new Gson().toJson("쪽지 복구에 실패하였습니다. 개발자에게 문의해주세요");						
		}
	}
	
	/** 휴지통에 있는 쪽지 영구 삭제 시키는 controller
	 * @param rcMultiMsgNo
	 * @param stMultiMsgNo
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="delete.msg", produces="application/json; charset=utf-8")
	public String ajaxDeleteMsg(int[] rcMultiMsgNo, int[] stMultiMsgNo, int memNo) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("rcMultiMsgNo",  rcMultiMsgNo);
		hm.put("stMultiMsgNo",  stMultiMsgNo);
		hm.put("memNo", memNo);
		int result = msgService.ajaxDeleteMsg(hm);
		if(result > 0) {
			return new Gson().toJson("쪽지들을 영구적으로 삭제하였습니다.");			
		}else {
			return new Gson().toJson("쪽지 삭제에 실패하였습니다. 개발자에게 문의해주세요");						
		}
	}
	
	// 일단 팝업창에서 ! 이름 검색으로 가져오는 회원정보들 가져오는 controller
	/** 팝업창 이름으로 검색해서 동료 정보 가져오는 Controller로 paging처리까지 같이 진행함 
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="searchMemList.msg", produces="application/json; charset=utf-8")
	public String searchMemListByName(String keyword, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {		
		int listCount = msgService.selectListCount(keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> memList = msgService.searchMemListByName(keyword, pi);
		// 2개의 값을 넘겨야한다. 이럴때는! 
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memList", memList);
		map.put("pi", pi);
		
	    return new Gson().toJson(map);
	}

	/** 팝업창에서 부서에 따라서 동료 정보를 가져오는 Controller
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="MemListByDept.msg", produces="application/json; charset=utf-8")
	public String searchMemListByDept(String keyword, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		//System.out.println(keyword);// 부서명이 담겨있어야한다. 
		
		int listCount = msgService.selectListCountByDept(keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> memList = msgService.searchMemListByDept(keyword, pi);
		// 2개의 값을 넘겨야한다. 이럴때는! 
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memList", memList);
		map.put("pi", pi);
		
	    return new Gson().toJson(map);
	}

	/** 팝업창에서 직급과 부서에 따라서 동료 정보를 가져오는 Controller
	 * @param deptKeyword
	 * @param rankKeyword
	 * @param currentPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="MemListByRank.msg", produces="application/json; charset=utf-8")
	public String searchMemListByRank(String deptKeyword, String rankKeyword, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		//System.out.println(deptKeyword);// 부서명이 담겨있어야한다.
		//System.out.println(rankKeyword);// 직급이 담겨있어야한다.
		HashMap<Object, Object> mapForCount = new HashMap<Object, Object>();
		mapForCount.put("deptKeyword", deptKeyword);
		mapForCount.put("rankKeyword", rankKeyword);
		
		int listCount = msgService.selectListCountByRank(mapForCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> memList = msgService.searchMemListByRank(mapForCount, pi);
		// 2개의 값을 넘겨야한다. 이럴때는! 
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memList", memList);
		map.put("pi", pi);
		
	    return new Gson().toJson(map);
	}
	
	
	/** 쪽지 보내는 Controller 
	 * @param memNo
	 * @param msgStatus
	 * @param contentStatus
	 * @param msgContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insert.msg", produces="application/json; charset=utf-8")
	public String insertMsg(int RecipientMemNo,int senderMemNo, String msgStatus, String contentStatus, String msgContent) {
		// 값들을 잘 넘어왔어 이제 HahMap에 담아서 넘겨주자!
		// 해당 Message쪽에는 memNo이 없다 한행에 하나의 쪽지로 관리하기에 Vo클래스에 memNo필드추가는 적절치 않다. 
		HashMap<Object, Object> msgInfo = new HashMap<Object, Object>();
		msgInfo.put("RecipientMemNo", RecipientMemNo);		
		msgInfo.put("senderMemNo", senderMemNo);
		msgInfo.put("msgStatus", msgStatus);
		msgInfo.put("contentStatus", contentStatus);
		msgInfo.put("msgContent", msgContent);
 
		//System.out.println(msgInfo);
		
		int result = msgService.insertMsg(msgInfo);
		if(result > 0) {
			return new Gson().toJson("성공적으로 쪽지를 보냈습니다. 보낸쪽지함을 확인해 주세요.");			
		}else {
			return new Gson().toJson("쪽지가 보내진것처럼 보이지만 실패하였습니다. 개발자에게 문의 해주세요");			
		}
	}

	
	@ResponseBody
	@RequestMapping(value="bringMem.msg", produces="application/json; charset=utf-8")
	public String bringMemInfoByMsgNo(int msgNo) {
		
		HashMap<Object, Object> memInfo = msgService.bringMemInfoByMsgNo(msgNo);
		return new Gson().toJson(memInfo);			
	}

	//---------------------------------------------------------------------------------------------------------------
	//-------------------------------------- 신고 관련  시작 -------------------------------------------------------------
	
	
	/** 신고처리하는 Controller 
	 * @param msgNo
	 * @param reporterNo
	 * @param reportedNo
	 * @param reportType
	 * @param reportContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertReport.msg", produces="application/json; charset=utf-8")
	public String insertMsgReport(int msgNo, int reporterNo, int reportedNo, String reportType, String reportContent) {
		MsgReport mr = new MsgReport();
		mr.setMsgNo(msgNo);
		mr.setReporterNo(reporterNo);
		mr.setReportedNo(reportedNo);
		mr.setReportType(reportType);
		mr.setReportContent(reportContent);
		// 정상적으로 값들 담겼다. 
		int result = msgService.insertMsgReport(mr);
		if(result > 0) {
			return new Gson().toJson("신고를 접수하였습니다. \n휴지통의 신고처리내역에서 \n정상적으로 신고가 되었는지 확인해주세요.");			
		}else {
			return new Gson().toJson("신고가 접수된것처럼 보이지만 실패하였습니다. 개발자에게 문의 해주세요");			
		}
	}

	/** 내가 신고한 목록 조회하는 controller (쪽지와는 다른 케이스이다. msg_report 테이블엑서 값을 뽑아와야한다)
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectReportList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectReportList(int memNo){
		ArrayList<MsgReport> list = msgService.ajaxselectReportList(memNo);		
	    return new Gson().toJson(list);
	}

	/** 신고 상세보기용 Controller 
	 * @param msgReportNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="reportDetail.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectReport(int msgReportNo){
		MsgReport reportDetail = msgService.ajaxSelectReport(msgReportNo);		
	    return new Gson().toJson(reportDetail);
	}
	
	/** 신고 철회하는 Controller (delete 처리함  받은쪽지함에서 잘보이게 하기 위해서 )
	 * @param msgReportNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="withdrawalReport.msg", produces="application/json; charset=utf-8")
	public String ajaxWithdrawalReport(int msgReportNo){
		// delete 처리하여서 alert를 잘띄워줘야함 
		int result = msgService.ajaxWithdrawalReport(msgReportNo);		
		if(result > 0) {// delete처리 완료 
			return new Gson().toJson("성공적으로 신고철회를 하였습니다. \n받은쪽지함을 확인해주세요.");			
		}else {
			return new Gson().toJson("신고철회에 실패하였습니다. \n개발자에게 문의해주세요.");						
		}
	}

	
}
