package com.kh.thezo.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.member.model.vo.Member;


@Repository
public class ApprovalDao {
	
	// 전 사원 정보
	public ArrayList<Member> employeeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("approvalMapper.employeeList");
	}
		
	// 해당 유저와관련된 전자결재 리스트 카운트
	public int selectListCount(Approval a, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.selectListCount",a);
	}
	
	//전자결재 메인페이지로 관련있는 결재리스트 불러오기
	public ArrayList<Approval> selectApprovalMain(Approval a, SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Approval> list = (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalMain", a, rowBounds);

		return list;	
	}
	
	// 문서양식 갯수 카운트
	public int newApprListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.newApprListCount");
	}
	
	// 문서양식 리스트 불러오기
	public ArrayList<Approval> newApprList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Approval> list = (ArrayList)sqlSession.selectList("approvalMapper.newApprList", null, rowBounds);
		return list;
	}
	
	// 문서 작성하는 페이지 
	public Approval enrollApproval(SqlSessionTemplate sqlSession, Approval aTemp) {
		return sqlSession.selectOne("approvalMapper.enrollApproval",aTemp);
	}
	
	// 문서 작성하는 페이지의 결재선 불러오기
	public ArrayList<ApprovalAccept> selectformLineList(SqlSessionTemplate sqlSession, Approval aTemp) {
		ArrayList<ApprovalAccept> line = (ArrayList) sqlSession.selectList("approvalMapper.customLine", aTemp);
		if (line.size()==0) {
			line = (ArrayList) sqlSession.selectList("approvalMapper.defaultLine", aTemp);
		}
		return line;
	}
	
	public int insertApproval(SqlSessionTemplate sqlSession, Approval a) {
		return  sqlSession.insert("approvalMapper.insertApproval",a);
		
	}
	public int deleteExsitedCustomLine(SqlSessionTemplate sqlSession, Approval a) {
		return  sqlSession.delete("approvalMapper.deleteExsitedCustomLine",a);
		
	}
	
	public int insertNewCustomLine(SqlSessionTemplate sqlSession, Approval a) {
		return  sqlSession.insert("approvalMapper.insertNewCustomLine",a);
	}
	
	public int insertSpecificDocuLine(SqlSessionTemplate sqlSession, Approval a) {
		return  sqlSession.insert("approvalMapper.insertSpecificDocuLine",a);
	}

	public int approvalMapper(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.reference",a);
		
	}
	
	public int insertDocuAttachment(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertDocuAttachment",a);
	}

	public int insertLeaveDocu(SqlSessionTemplate sqlSession , Approval a) {
		return sqlSession.insert("approvalMapper.insertLeaveDocu",a);
	}
	
	public int updateLeaveDocu(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.updateLeaveDocu",a);		
	}
	
	public Member selectLeave(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("approvalMapper.selectLeave",memNo);
	}
	
	public Approval detailApproval(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.selectOne("approvalMapper.detailApproval",docNo);
	}
	
	public ArrayList<Attachment> detailApprovalAt(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.detailApprovalAt",docNo);
	}
	
	

	public ArrayList<ApprovalAccept> detailApprovalLine(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.detailApprovalLine",docNo);
	}
	
	public int approveDocu(SqlSessionTemplate sqlSession, ApprovalAccept a) {
		return sqlSession.update("approvalMapper.approveDocu",a);
	}
	
	public int setApprovalStatus(SqlSessionTemplate sqlSession, int lastApprover, ApprovalAccept a) {
		if(lastApprover==a.getMemNo()) {
			a.setStatus("완료");
		}
		return sqlSession.update("approvalMapper.setApprovalStatus",a);

	}
	
//	public int selectRecentTemp(SqlSessionTemplate sqlSession, int memNo) {
//		return sqlSession.selectOne("approvalMapper.selectRecentTemp",memNo);
//
//	}
	
	
}









