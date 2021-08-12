package com.kh.thezo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;

public interface MemberService {


	// 로그인용 서비스
	Member loginMember(Member m);
	
	// 1_1. 관리자 : 회원 정보 관리 리스트 페이지 조회용
	int selectListCount();
	ArrayList<Member> selectList(PageInfo pi);
	
	// 1_2. 관리자 : 회원 정보 관리 리스트 페이지 검색 조회용
	public int memSearchListCount(HashMap<String, String> map);
	public ArrayList<Member> memSearchList(PageInfo pi, HashMap<String, String> map);
	
	// 2. 관리자 : 회원 정보 상세 조회용
	Member selectMember(int memNo);
	
	// 3_1. 관리자 : 회원 삭제 리스트 페이지 조회용
	int memDeleteListCount();
	ArrayList<Member> memDeleteList(PageInfo pi);
	
	// 3_2. 관리자 : 회원 삭제 리스트 페이지 검색 조회용
	public int memDeleteSearchListCount(HashMap<String, String> map);
	public ArrayList<Member> deleteSearchList(PageInfo pi, HashMap<String, String> map);
	
	// 4. 아이디 중복 체크용 서비스
	int idCheck(String memId);
	
	// 5. 관리자 : 사원등록
	int insertMember(Member m);
	
	// 6. 사용자 : 내 정보 수정하기 
	int updateMember(Member m);

	// 7. 관리자 : 회원 정보 수정
	int adMemberUpdate(Member m);
	
	// 8. 관리자 : 회원 정보 삭제
	int deleteMember(int memNo);
	
}
