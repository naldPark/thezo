package com.kh.thezo.chatting.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.chatting.model.dao.ChattingDao;

//@author Jaewon.s

@Service
public class ChattingServiceImpl implements ChattingService{
	@Autowired 
	private ChattingDao chatDao;	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	/** 단순하게 채팅로그 insert시켜버리는 서비스
	 */
	@Override
	public void InsertChatContent(HashMap<Object, Object> hm) {
		chatDao.InsertChatContent(sqlSession, hm) ;
	}

}
