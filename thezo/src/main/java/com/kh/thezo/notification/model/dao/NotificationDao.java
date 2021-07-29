package com.kh.thezo.notification.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
@Repository //DB와 접근하는 클래스이다! 
public class NotificationDao {

	/** 기존에 완벽히 동일한 조건의 알림이 있는지체크라는 메소드 
	 * @param sqlSession
	 * @param nf
	 * @return
	 */
	public String beforeInsertCheck(SqlSessionTemplate sqlSession, Notification nf) {
		return sqlSession.selectOne("notificationMapper.beforeInsertCheck",nf);		
	}

	/** 실질적으로 insert를 알림 테이블과 nf_chaek 테이블에 삽입 시키는 메소드
	 * @param sqlSession
	 * @param nf
	 * @return
	 */
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
	
	//	--------------------아래는 조회용 DAO 메소드들 ----------------------------------------
	

	/** 모든 알림 게시글 갯수 조회용 
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("notificationMapper.selectListCount");
	}

	/** 위 메소드를 통해서 만들 pi객체를 인자로서 받아 내가 원하는 만큼의 알림 게시글을 담는 메소드
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notification> SelectAndViewNotificationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds  rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 넘겨줄 값이 따로 없어서 매개변수 자리가 null이다. 여기 비우면 !!! 원하는데로 rowBounds를 사용할수가 없다! 
		return (ArrayList)sqlSession.selectList("notificationMapper.SelectAndViewNotificationList",null, rowBounds);
	}

	//----------------------- 아래는 ~~~ 메소드들 ---------------------------------------------
	
}
