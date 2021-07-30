package com.kh.thezo.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public int marketSearchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Market> marketSearchList(PageInfo pi, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
