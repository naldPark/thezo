package com.kh.thezo.approval.model.service;

import java.util.ArrayList;

import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.common.model.vo.PageInfo;

public interface ApprovalService {

	int selectListCount(Approval a);
	
	ArrayList<Approval> selectApprovalMain(int memNo, PageInfo pi);
	
}
