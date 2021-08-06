package com.kh.thezo.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.board.model.vo.BoardFile;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.market.model.dao.MarketDao;
import com.kh.thezo.market.model.vo.Market;

@Service
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDao mkDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 사용자 : 벼룩시장 글 갯수 조회
	@Override
	public int marketListCount() {
		return mkDao.marketListCount(sqlSession);
	}

	// 사용자 : 벼룩시장 리스트 조회
	@Override
	public ArrayList<Market> selectMarketList(PageInfo pi) {
		return mkDao.selectMarketList(sqlSession, pi);
	}

	// 사용자 : 벼룩시장 검색바 글 갯수 조회
	@Override
	public int marketSearchListCount(HashMap<String, String> map) {
		return mkDao.marketSearchListCount(sqlSession, map);
	}

	// 사용자 : 벼룩시장 검색바 리스트 조회
	@Override
	public ArrayList<Market> marketSearchList(PageInfo pi, HashMap<String, String> map) {
		return mkDao.marketSearchList(sqlSession, pi, map);
	}
	
	// 사용자 : 벼룩시장 상세 조회용(조회수)
	@Override
	public int increaseMarketCount(int marketNo) {
		return mkDao.increaseMarketCount(sqlSession, marketNo);
	}

	// 사용자 : 벼룩시장 상세 조회
	@Override
	public Market selectMarket(int marketNo) {
		return mkDao.selectMarket(sqlSession, marketNo);
	}

	// 사용자 : 벼룩시장 등록(글)
	@Override
	public int insertMarket(Market mk) {
		return mkDao.insertMarket(sqlSession, mk);
	}

	

}
