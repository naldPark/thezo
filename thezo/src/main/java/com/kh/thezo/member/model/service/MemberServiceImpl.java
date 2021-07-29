package com.kh.thezo.member.model.service;

import java.util.ArrayList;

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

}
