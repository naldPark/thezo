package com.kh.thezo.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
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
	public ArrayList<Approval> selectApprovalMain(int memNo, SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Approval> list = (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalMain", memNo, rowBounds);

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
	
	public int insertApprovalDocument(SqlSessionTemplate sqlSession, Approval a) {
		int result = 0;
		result = sqlSession.insert("approvalMapper.insertApproval",a);
		result = result*sqlSession.delete("approvalMapper.deleteExsitedCustomLine",a);
		result = result*sqlSession.insert("approvalMapper.insertNewCustomLine",a);
		result = result*sqlSession.insert("approvalMapper.insertSpecificDocuLine",a);
		if(a.getRefMemNoAry()!=null) {
			result = result*sqlSession.insert("approvalMapper.reference",a);
		}
		if(a.getAt()!=null) {
			result = result*sqlSession.insert("approvalMapper.insertDocuAttachment",a);
		}
		if(a.getFormNo()==5) {
			result = result*sqlSession.insert("approvalMapper.insertLeaveDocu",a);
		}
		return result;
	}
	
}









