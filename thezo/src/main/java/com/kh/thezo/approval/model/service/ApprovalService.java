package com.kh.thezo.approval.model.service;

import java.util.ArrayList;

import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.common.model.vo.PageInfo;

public interface ApprovalService {

	ArrayList<Approval> selectApprovalMain(int memNo, PageInfo pi);
	
}
