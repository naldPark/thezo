package com.kh.thezo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.market.model.vo.Market;
import com.kh.thezo.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 1) 회원 수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	// 2) 리스트 조회
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null , rowBounds );
	}
	
	// 3_1) 회원 관리 리스트 검색 조회(갯수)
	public int memSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.memSearchListCount", map);
	}
	
	// 3_2) 회원 관리 리스트 검색 조회
	public ArrayList<Member> memSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.memSearchList", map, rowBounds);
	}
	
	
	// 4) 회원 정보 상세 조회
	public Member selectMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMember", memNo);
	}
	
	
	// 5_1) 사원 등록 : 아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}
	
	// 5_2) 사원 등록 
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	
	
	
	
	// 회원 삭제 : 관리자 - 이성경
	// 1) 회원 삭제 리스트 갯수 조회(탈퇴 회원수 조회)
	public int memDeleteListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.memDeleteListCount");
	}
	
	// 2) 회원 삭제 리스트 조회 : 관리자 - 이성경
	public ArrayList<Member> memDeleteList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.memDeleteList", null , rowBounds );
	}
	
	// 3_1) 회원 삭제 리스트 검색 조회(갯수) : 관리자 - 이성경
	public int memDeleteSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.memDeleteSearchListCount", map);
	}
	
	// 3_2) 회원 삭제 리스트 검색 조회 : 관리자 - 이성경
	public ArrayList<Member> deleteSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.deleteSearchList", map, rowBounds);
	}

	
	// 6. 내 정보 수정 : 사용자 - 이성경
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
}
