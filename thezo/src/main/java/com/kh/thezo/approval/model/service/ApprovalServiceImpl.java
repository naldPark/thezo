package com.kh.thezo.approval.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.approval.model.dao.ApprovalDao;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.OrgChartList;
import com.kh.thezo.common.model.vo.PageInfo;

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
	public Approval enrollApproval(int ano) {
		return aDao.enrollApproval(sqlSession, ano);
	}

	@Override
	public int insertApprovalDocument(Approval a) {
		return 0;
	}

	@Override
	public ArrayList<OrgChartList> employeeList() {
		return aDao.employeeList(sqlSession);
	}

	


	
}
