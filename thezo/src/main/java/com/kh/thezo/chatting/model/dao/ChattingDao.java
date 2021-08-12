package com.kh.thezo.chatting.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//@author Jaewon.s
@Repository 
public class ChattingDao {

	public void InsertChatContent(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		//if(sqlSession.insert("chattingMapper.InsertChatContent", hm)>0) {
		//	System.out.println("성공적으로 채팅 로그 기록했어");
		//}else {
		//	System.out.println("채팅 기록에 실패함 ");
		//}
		System.out.println(hm);
	}

}
