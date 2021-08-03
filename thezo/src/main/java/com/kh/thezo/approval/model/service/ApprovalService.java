package com.kh.thezo.approval.model.service;

import java.util.ArrayList;


import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;

public interface ApprovalService {
	
	// 조직트리에서 사원을 조회하기 위한 메소드
	ArrayList<Member> employeeList();

	// 해당 유저와관련된 전자결재 리스트 카운트
	int selectListCount(Approval a);
	
	// 해당 유저와관련된 전자결재 리스트
	ArrayList<Approval> selectApprovalMain(Approval a, PageInfo pi);
	
	// 문서양식 갯수 카운트
	int newApprListCount();
	
	// 문서양식 리스트 불러오기
	ArrayList<Approval> newApprList(PageInfo pi);
	
	// 문서 작성하는 페이지 
	Approval enrollApproval(Approval aTemp);
	
	// 신규 기안하기 insert 메소드
	int insertApprovalDocument(Approval a);

	
	// 문서 작성하는 페이지의 결재선 불러오기
	ArrayList<ApprovalAccept> selectformLineList(Approval aTemp);
	
	// 연차신청시 잔여연차 조회
	Member selectLeave(int memNo);
	
	// 문서상세페이지 
	Approval detailApproval(int docNo);
	
	// 문서상세페이지 결재선
	ArrayList<ApprovalAccept> detailApprovalLine(int docNo);
	
	// 전자결재 승인
	int approveDocu(int lastApprover, ApprovalAccept a);
	
	// 임시저장했을때 docNo 출력해오는 select
//	int selectRecentTemp(int memNo);
	

	// 신규 임시저장 insert 메소드
//	int tempApproval(Approval a);


}
