package com.kh.thezo.approval.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

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
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public HashMap<String, Integer> mainApprCount(int memNo) {
		return aDao.mainApprCount(memNo, sqlSession);
	}
	
	@Override
	public ArrayList<Approval> selectApprovalMain(Approval a) {
		 return aDao.selectApprovalMain(a, sqlSession);
	}
	
	@Override
	public int selectListCount(Approval a) {
		return aDao.selectListCount(a, sqlSession);
	}
	
	@Override
	public ArrayList<Approval> selectApprovalMain(Approval a, PageInfo pi) {
		 return aDao.selectApprovalMain(a, sqlSession, pi);
	}
	
	@Override
	public ArrayList<ApprovalAccept> selectApprovalRead(Approval a) {
		return aDao.selectApprovalRead(a, sqlSession);
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
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
        TransactionStatus status = transactionManager.getTransaction(def);
        int result=1;
		result= result*aDao.insertApproval(sqlSession, a);
		result= result+aDao.deleteExsitedCustomLine(sqlSession, a);
		result= result*aDao.insertNewCustomLine(sqlSession, a);
		result= result*aDao.insertSpecificDocuLine(sqlSession, a);
		if(a.getRefMemNoAry()!=null) {
			result= result*aDao.approvalMapper(sqlSession, a);
		}
		if(a.getAt()!=null) {
			result= result*aDao.insertDocuAttachment(sqlSession, a);
		}
		// 문서가 연차신청서인 경우
		if(a.getFormNo()==5) {
			result= result*aDao.insertLeaveDocu(sqlSession, a);
			result= result*aDao.updateLeaveDocu(sqlSession, a);
		}
		if(result>0) {
			transactionManager.commit(status);
		} else{
			transactionManager.rollback(status);
		}
		return result;
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
		Approval a = aDao.detailApproval(sqlSession, docNo);
		try {
			a.setAt(aDao.detailApprovalAt(sqlSession, docNo));
		}catch(RuntimeException e) {}
		return a;
	}
	
	@Override
	public void detailReadUpdate(HashMap<String, Integer> hs) {
		int result =0;
		result= result+aDao.detailApprovalReadUpdate(sqlSession, hs);
		result= result+aDao.detailReferenceReadUpdate(sqlSession, hs);
	}	

	@Override
	public ArrayList<ApprovalAccept> detailApprovalLine(int docNo) {
		return aDao.detailApprovalLine(sqlSession, docNo);
	}
	
	// 전자결재 승인
	@Override
	public int approveDocu(int lastApprover, ApprovalAccept a) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
        int result=1;
        result= result*aDao.approveDocu(sqlSession, a);
        // 마지막 결재자인 경우 문서를 완료로 처리 
		if((lastApprover==a.getMemNo()&&a.getStatus().equals("승인"))) {
			a.setStatus("완료");
		}
        result = result*aDao.setApprovalStatus(sqlSession, a);
        if(result>0) {
			transactionManager.commit(status);
		} else{
			transactionManager.rollback(status);
		}
		return result;
	}

	// 연차신청 승인 반려 하는 경우 추가 update문
	@Override
	public int updateLeaveStatus(int lastApprover,ApprovalAccept a) {
		
		int result=  1;
		// leave테이블에서 승인 처리
		if(lastApprover==a.getMemNo()&&a.getStatus().equals("완료")) {
			a.setStatus("승인");
			result = aDao.updateLeaveStatus(sqlSession, a);
		}
		if(a.getStatus().equals("반려")) {
			result = aDao.updateLeaveStatus(sqlSession, a);
			Approval leaveMem = aDao.selectLeaveCount(sqlSession, a.getDocNo());
			if(leaveMem.getLeaveCount()!=0) {
				result = aDao.updateLeaveCount(sqlSession, leaveMem);
			}
		}
		return result;
	}
		
	@Override
	public int cancelDocu(Approval a) {
		return aDao.cancelDocu(sqlSession, a);
	}


//	@Override
//	public int tempApproval(Approval a) {
//		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//		
//        TransactionStatus status = transactionManager.getTransaction(def);
//        int result=1;
//		result= result*aDao.insertApproval(sqlSession, a);
//		result= result*aDao.insertSpecificDocuLine(sqlSession, a);
//		if(a.getRefMemNoAry()!=null) {
//			result= result*aDao.approvalMapper(sqlSession, a);
//		}
//		if(a.getAt()!=null) {
//			result= result*aDao.insertDocuAttachment(sqlSession, a);
//		}
//		if(result>0) {
//			transactionManager.commit(status);
//		} else{
//			transactionManager.rollback(status);
//		}
//		if(result>0) {
//			transactionManager.commit(status);
//		} else{
//			transactionManager.rollback(status);
//		}
//		
//		return result;
//	}
//
//	@Override
//	public int selectRecentTemp(int memNo) {
//		return aDao.selectRecentTemp(sqlSession, memNo);
//	}

	

	


	
}
