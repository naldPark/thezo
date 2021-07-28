package com.kh.thezo.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.OrgChartList;
import com.kh.thezo.common.model.vo.PageInfo;


@Repository
public class ApprovalDao {
	
	// 전 사원 정보
	public ArrayList<OrgChartList> employeeList(SqlSessionTemplate sqlSession) {
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
	public Approval enrollApproval(SqlSessionTemplate sqlSession, int ano) {
		return sqlSession.selectOne("approvalMapper.enrollApproval",ano);
	}
	
	
}









