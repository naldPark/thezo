package com.kh.thezo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.dao.MemberDao;
import com.kh.thezo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 담당자가 없는거같아서 제가 그냥 작성했어요(영익)
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 1) 회원 수 조회
	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}
	
	// 2) 리스트 조회
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return mDao.selectList(sqlSession, pi);
	}
	
	// 3_1) 회원 관리 리스트 검색 조회(갯수) 
	@Override
	public int memSearchListCount(HashMap<String, String> map) {
		return mDao.memSearchListCount(sqlSession, map);
	}

	// 3_2) 회원 관리 리스트 검색 조회
	@Override
	public ArrayList<Member> memSearchList(PageInfo pi, HashMap<String, String> map) {
		return mDao.memSearchList(sqlSession, pi, map);
	}

	// 4) 회원정보 상세조회
	@Override
	public Member selectMember(int memNo) {
		return mDao.selectMember(sqlSession, memNo);
	}

	// 회원 삭제 : 관리자 - 이성경
	// 1) 회원 삭제 리스트 갯수 조회(탈퇴 회원수 조회)
	@Override
	public int memDeleteListCount() {
		return mDao.memDeleteListCount(sqlSession);
	}

	// 2) 회원 삭제 리스트 조회
	@Override
	public ArrayList<Member> memDeleteList(PageInfo pi) {
		return mDao.memDeleteList(sqlSession, pi);
	}

	// 3_1) 회원 삭제 리스트 검색 조회(갯수)
	@Override
	public int memDeleteSearchListCount(HashMap<String, String> map) {
		return mDao.memDeleteSearchListCount(sqlSession, map);
	}

	// 3_2) 회원 삭제 리스트 검색 조회
	@Override
	public ArrayList<Member> deleteSearchList(PageInfo pi, HashMap<String, String> map) {
		return mDao.deleteSearchList(sqlSession, pi, map);
	}

	

}
