package com.kh.thezo.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	// 홈페이지 메인페이지에 전자결재 읽지않은 문서 카운트
	public HashMap<String, Integer> mainApprCount(int memNo,SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.mainApprCount",memNo);
	}
	
	// 홈페이지 메인페이에 결재리스트 불러오기
	public ArrayList<Approval> selectApprovalMain(Approval a, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalMain", a, new RowBounds(0, 6));

	}
	
	// 전 사원 정보
	public ArrayList<Member> employeeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("approvalMapper.employeeList");
	}
	
	/**
	 *  문서조회 관련 Dao
	 */

	// 해당 유저와관련된 전자결재 리스트 카운트
	public int selectListCount(Approval a, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.selectListCount", a);
	}

	// 전자결재 메인페이지로 관련있는 결재리스트 불러오기
	public ArrayList<Approval> selectApprovalMain(Approval a, SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalMain", a, rowBounds);
	}

	// 전자결재 리스트에서 수신자에 해당하는 사람이 해당 문서를 읽었는지 여부를 체크
	public ArrayList<ApprovalAccept> selectApprovalRead(Approval a, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalRead", a);
	}
	
	// 상세문서 조회 페이지에 사용할 메소드 시작
	public Member selectLeave(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("approvalMapper.selectLeave", memNo);
	}

	public Approval detailApproval(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.selectOne("approvalMapper.detailApproval", docNo);
	}

	public ArrayList<Attachment> detailApprovalAt(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.detailApprovalAt", docNo);
	}

	public int detailApprovalReadUpdate(SqlSessionTemplate sqlSession, HashMap<String, Integer> hs) {
		return sqlSession.insert("approvalMapper.detailApprovalReadUpdate", hs);
	}

	public int detailReferenceReadUpdate(SqlSessionTemplate sqlSession, HashMap<String, Integer> hs) {
		return sqlSession.insert("approvalMapper.detailReferenceReadUpdate", hs);
	}

	public ArrayList<ApprovalAccept> detailApprovalLine(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.detailApprovalLine", docNo);
	}
	// 상세문서 조회 페이지에 사용할 메소드 끝

	
	/**
	 *  문서작성 관련 Dao
	 */
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
	
	// 문서 기안시 사용하는 메소드 시작
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
	// 문서 기안시 사용하는 메소드 끝
	
	/**
	 *  연차관련 Dao
	 */
	//기안한 문서가 연차신청서인 경우 LEAVE테이블에 insert
	public int insertLeaveDocu(SqlSessionTemplate sqlSession , Approval a) {
		return sqlSession.insert("approvalMapper.insertLeaveDocu",a);
	}
	
	//기안한 문서가 연차신청서인 경우 Member테이블에 잔여연차 사용연차 update
	public int updateLeaveDocu(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.updateLeaveDocu",a);		
	}
	
	// 연차신청을 최종승인/반려할경우 leave테이블 status업데이트
	public int updateLeaveStatus(SqlSessionTemplate sqlSession, ApprovalAccept a) {
		return sqlSession.update("approvalMapper.updateLeaveStatus",a);
	}
	
	// 연차신청을 반려할경우 해당 문서에서 차감된 연차 조회해오기
	public Approval selectLeaveCount(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.selectOne("approvalMapper.selectLeaveCount",docNo);
	}
	
	// 연차신청을 반려할경우 member테이블에 차감연차 원상복구
	public int updateLeaveCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateLeaveCount",a);
	}
		
	
	/**
	 *  결재/반려/회수 관련 Dao
	 */
	
	// 결재자가 결재/반려시 사용하는 메소드 시작
	public int approveDocu(SqlSessionTemplate sqlSession, ApprovalAccept a) {
		return sqlSession.update("approvalMapper.approveDocu",a);
	}	
	public int setApprovalStatus(SqlSessionTemplate sqlSession, ApprovalAccept a) {
		return sqlSession.update("approvalMapper.setApprovalStatus",a);
	}
	// 결재자가 결재/반려시 사용하는 메소드 끝
			
	//회수
	public int cancelDocu(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.setApprovalStatus",a);
	}
	
	
	
//	public int selectRecentTemp(SqlSessionTemplate sqlSession, int memNo) {
//		return sqlSession.selectOne("approvalMapper.selectRecentTemp",memNo);
//
//	}
	
	
}









