package com.kh.thezo.approval.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.approval.model.dao.ApprovalDao;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Approval> selectApprovalMain(int memNo, PageInfo pi) {
		
		ArrayList<Approval> alist = aDao.selectApprovalMain(sqlSession, pi);
		
		return alist;
	}
	
}
