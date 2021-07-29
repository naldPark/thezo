package com.kh.thezo.notification.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.notification.model.dao.NotificationDao;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired 
	private NotificationDao nfDao;	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	//↑ 기본 세팅 	↓ 비즈니스 로직 시작
	
	
	/** 알림 등록 서비스
	 * @author Jaewon.s
	 */
	@Override
	public int insertNotification(Notification nf) {
		if(nfDao.beforeInsertCheck(sqlSession, nf) == null) {
			return nfDao.insertNotification(sqlSession, nf);			
		}else {
			return 0;
		}		
	}

}
