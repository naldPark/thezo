package com.kh.thezo.notification.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
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

	//	--------------------아래는 페이지 로딩시 페이징 바와 알림목록들 보여지게 하기위한 서비스들 -------------------------------

	/** 알림 전체 갯수 가져오는 서비스 (게시글 총갯수) 
	 */
	@Override
	public int selectListCount() {
		return nfDao.selectListCount(sqlSession);
	}


	/** 원하는 알림 가져와서 관리자 화면단에 뿌려줄 값을 담은 서비스
	 */
	@Override
	public ArrayList<Notification> SelectAndViewNotificationList(PageInfo pi) {
		return nfDao.SelectAndViewNotificationList(sqlSession, pi);
	}

	//	--------------------아래는 ~~~~~~~~~서비스들 -------------------------------

}
