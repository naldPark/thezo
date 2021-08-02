package com.kh.thezo.notification.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
@Repository //DB와 접근하는 클래스이다! 
public class NotificationDao {
	//------------------------------※ 관리자단 알림  Date Object Access들  -------------------------------------------------------
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

	/**  알림 번호를 가지고 하나의 알림을 선택해서 일부 정보를 가져오는 메소드 
	 * @param sqlSession
	 * @param nfNo
	 * @return
	 */
	public Notification selectNotification(SqlSessionTemplate sqlSession, int nfNo) {
		return sqlSession.selectOne("notificationMapper.selectNotification",nfNo);
	}
	
	/** 선택한 알림 삭제처리 (update문으로 del_status변경)하는 메소드
	 * @param sqlSession
	 * @param nfNo
	 * @return
	 */
	public int deleteNotification(SqlSessionTemplate sqlSession, int nfNo) {
		return sqlSession.update("notificationMapper.deleteNotification", nfNo);
	}
	
	//	-------------------------------------- 알림 수정 경우의 수 ---------------------------------------
	/** 첫번째 케이스로 단순하게 기존것을 부서명은 동일 하고 재알림이없어 수정만 하는 메소드
	 * @param sqlSession
	 * @param nf
	 * @return
	 */
	public int updateNotificationCase1(SqlSessionTemplate sqlSession, Notification nf) {
		return sqlSession.update("notificationMapper.updateNotificationCase1", nf);
	}

	/** 두번째 케이스로 부서가 다른! 경우이며 재알림 설정이 없는 경우와    ▶  재알림은 되어있지만 기존 부서와 다른 경우 메소드
	 * @param sqlSession
	 * @param nf 
	 * @return
	 */
	public int updateNotificationCase2(SqlSessionTemplate sqlSession, Notification nf, String originNdDeptName) {
		Notification delNf = new Notification();
		delNf.setNfNo(nf.getNfNo());
		delNf.setNfDeptName(originNdDeptName);
		int firstStep = sqlSession.delete("notificationMapper.deleteOriginNfCheck", delNf);
		if(firstStep>0) {//기존의 알람에 딸려있는 모든 읽음 여부 싸그리 읽음으로 표기 
			int sencondStep = sqlSession.update("notificationMapper.updateNotificationCase1", nf);
			if(sencondStep>0) {// Notification에 update가 되었을경우! 
				return sqlSession.insert("notificationMapper.insertNfCheck", nf);
			}else {
				return 0;
			}
		}else {
			return 0;
		}
	}

	/** 세번째 케이스로 재알림이 설정이 되어있고  기존부서와 일치하는 경우 메소드 
	 * @param sqlSession
	 * @param nf
	 * @return
	 */
	public int updateNotificationCase3(SqlSessionTemplate sqlSession, Notification nf) {
		int firstStep = sqlSession.update("notificationMapper.updateNotificationCase1", nf);
		if(firstStep>0) {
			return sqlSession.insert("notificationMapper.updateNfCheckUnRead", nf);
		}else {
			return 0;
		}
	}


	//------------------------------※ 사용자단 알림  Date Object Access들  -------------------------------------------------------

	/** ajax로 나의 memNo를 기준으로 알림 목록 가져오는 dao 
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Notification> ajaxSelectListNf(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("notificationMapper.ajaxSelectListNf", memNo);
	}
	
	/** 단순히 읽지 않은 알림 갯수 조회해오는 ajax dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public int ajaxCountUnreadedNf(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("notificationMapper.ajaxCountUnreadedNf", memNo);
	}

	/** 읽지않은 알림 리스트 가져오는 ajax dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Notification> ajaxSelectUnreadedNf(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("notificationMapper.ajaxSelectUnreadedNf", memNo);
	}

	
	/** 받은 알림을 읽음 처리하는 dao
	 * @param sqlSession
	 * @param nfNoList
	 * @return
	 */
	public int ajaxUpdateUserNf(SqlSessionTemplate sqlSession, HashMap<Object, Object> nfNoList) {
		return sqlSession.update("notificationMapper.ajaxUpdateUserNf", nfNoList);
	}


	
}
