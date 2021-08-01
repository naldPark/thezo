package com.kh.thezo.approval.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.approval.model.dao.ApprovalDao;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(Approval a) {
		return aDao.selectListCount(a, sqlSession);
	}

	@Override
	public ArrayList<Approval> selectApprovalMain(int memNo, PageInfo pi) {
		return aDao.selectApprovalMain(memNo, sqlSession, pi);
	}

	@Override
	public int newApprListCount() {
		return aDao.newApprListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> newApprList(PageInfo pi) {
		return aDao.newApprList(sqlSession, pi);
	}


	@Override
	public Approval enrollApproval(Approval aTemp) {
		return aDao.enrollApproval(sqlSession, aTemp);
	}
	
	@Override
	public ArrayList<ApprovalAccept> selectformLineList(Approval aTemp) {
		return aDao.selectformLineList(sqlSession, aTemp);
	}

	@Override
	public int insertApprovalDocument(Approval a) {
		
		return aDao.insertApprovalDocument(sqlSession, a);
	}

	@Override
	public ArrayList<Member> employeeList() {
		return aDao.employeeList(sqlSession);
	}

	@Override
	public Member selectLeave(int memNo) {
		return aDao.selectLeave(sqlSession, memNo);
	}

	@Override
	public Approval detailApproval(int docNo) {
		return aDao.detailApproval(sqlSession, docNo);
	}

	@Override
	public ArrayList<ApprovalAccept> detailApprovalLine(int docNo) {
		return aDao.detailApprovalLine(sqlSession, docNo);
	}

	


	
}
