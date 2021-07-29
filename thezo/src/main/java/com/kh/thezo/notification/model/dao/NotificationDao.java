package com.kh.thezo.notification.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
@Repository //DB와 접근하는 클래스이다! 
public class NotificationDao {

	public String beforeInsertCheck(SqlSessionTemplate sqlSession, Notification nf) {
		return sqlSession.selectOne("notificationMapper.beforeInsertCheck",nf);		
	}

	public int insertNotification(SqlSessionTemplate sqlSession, Notification nf) {		
		int fisrtStep = sqlSession.insert("notificationMapper.insertNotification", nf);
		if(fisrtStep>0) {
			int secondStep = sqlSession.selectOne("notificationMapper.selectRightNfNo",nf);
			// thirdStep으로 trigger마냥 NF_CHECK테이블에도 값을 넣기인데 다음 부터는 트리거로 만들자.
			nf.setNfNo(secondStep);
			// 제대로 값들이 들어갔는지 확인
			return sqlSession.insert("notificationMapper.insertNfCheck", nf);
		}else {
			return 0;
		}
	}


	
}
