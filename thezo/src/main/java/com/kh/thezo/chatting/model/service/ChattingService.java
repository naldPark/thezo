package com.kh.thezo.chatting.model.service;

import java.util.HashMap;

//@author Jaewon.s
public interface ChattingService {

	// 체팅 내용 넣는 서비스이다. 단순하게 채팅로그 insert시켜버리는 서비스
	void InsertChatContent(HashMap<Object, Object> hm);

}
