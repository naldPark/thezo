package com.kh.thezo.member.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;

public interface MemberService {

	// 1. 관리자 : 회원 정보 관리 리스트 페이지 조회용
	int selectListCount();
	ArrayList<Member> selectList(PageInfo pi);
	
	
}
