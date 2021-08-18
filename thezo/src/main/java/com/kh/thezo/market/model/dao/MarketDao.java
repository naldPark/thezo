package com.kh.thezo.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.board.model.vo.Reply;
import com.kh.thezo.board.model.vo.Report;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.market.model.vo.Market;
import com.kh.thezo.market.model.vo.PLike;

@Repository
public class MarketDao {

	// 사용자 : 벼룩시장 글 갯수 조회
	public int marketListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("marketMapper.marketListCount");
	}
	
	// 사용자 : 벼룩시장 리스트 조회
	public ArrayList<Market> selectMarketList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.selectMarketList", null , rowBounds );
	}
	
	// 사용자 : 벼룩시장 검색바 글 갯수 조회
	public int marketSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("marketMapper.marketSearchListCount", map);
	}
	
	// 사용자 : 벼룩시장 검색바 리스트 조회
	public ArrayList<Market> marketSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.marketSearchList", map, rowBounds);
	}
	
	// 사용자 : 벼룩시장 상세 조회용(조회수)
	public int increaseMarketCount(SqlSessionTemplate sqlSession, int marketNo) {
		return sqlSession.update("marketMapper.increaseMarketCount", marketNo);
	}
		
	// 사용자 : 벼룩시장 상세 조회
	public Market selectMarket(SqlSessionTemplate sqlSession, int marketNo) {
		return sqlSession.selectOne("marketMapper.selectMarket", marketNo);
	}
	
	// 사용자 : 벼룩시장 글 등록 
	public int insertMarket(SqlSessionTemplate sqlSession, Market mk) {
		return sqlSession.insert("marketMapper.insertMarket", mk);
	}
		
	// 사용자 : 벼룩시장 삭제
	public int deleteMarket(SqlSessionTemplate sqlSession, int marketNo) {
		return sqlSession.update("marketMapper.deleteMarket", marketNo);
	}
	
	// 사용자 : 벼룩시장 수정
	public int updateMarket(SqlSessionTemplate sqlSession, Market mk) {
		return sqlSession.update("marketMapper.updateMarket", mk);
	} 
	
	// 사용자 : 벼룩시장 댓글 조회
	public ArrayList<Reply> marketReplyList(SqlSessionTemplate sqlSession, int marketNo){
		return (ArrayList)sqlSession.selectList("marketMapper.marketReplyList", marketNo);
	}
		
	// 사용자 : 벼룩시장 댓글 작성
	public int insertMarketReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("marketMapper.insertMarketReply", r);
	}
	
	// 사용자 : 벼룩시장, 댓글 신고
	public int marketReport(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("marketMapper.marketReport", rp);
	}
	
	// 사용자 : 벼룩시장 댓글 삭제
	public int deleteMarketReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("marketMapper.deleteMarketReply", replyNo);
	}
	
	// 벼룩시장 찜하기 (수정중)
    public void insertMarketLike(SqlSessionTemplate sqlSession, PLike p) throws Exception {
        sqlSession.insert("marketMapper.insertMarketLike",p);
    }

    public void deleteMarketLike(SqlSessionTemplate sqlSession,PLike p) throws Exception {
    	sqlSession.delete("marketMapper.deleteMarketLike",p);
    }

    public void updateMarketLike(SqlSessionTemplate sqlSession, String memId) throws Exception {
    	sqlSession.update("marketMapper.updateMarketLike", memId);
    }
    
    public int selectMarketLike(SqlSessionTemplate sqlSession, HashMap<String,String> likeCheck) {
    	return sqlSession.selectOne("marketMapper.selectMarketLike", likeCheck);
    }
    

}
