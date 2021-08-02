package com.kh.thezo.notification.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	//------------------------------※ 관리자단 알림 로직들 -------------------------------------------------------
	/** 알림 등록 서비스 
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

	//	--------------------아래는 알림 내부적으로 돌아가는 로직 서비스들 -------------------------------
	/** AJAX로 하나의 알림 정보를 가져오는 메소드 최소 2번 이상 쓰일 서비스
	 */
	@Override
	public Notification selectNotification(int nfNo) {
		return nfDao.selectNotification(sqlSession, nfNo);
	}

	/** 선택한 알림 삭제처리 (update문으로 del_status변경)하는 서비스 
	 */
	@Override
	public int deleteNotification(int nfNo) {
		return nfDao.deleteNotification(sqlSession, nfNo);
	}	
	
	/**사용자의 선택 사항에 따라서 달라지는 서비스로 기존 알림을 업데이트 할떄의 서비스 
	 */
	@Override
	public int updateNotification(Notification nf, String originNdDeptName, String reNotify) {
		int result;
		// 이거 3개 가지고 만들어주면된다! 
		if(reNotify == null) {// 단순하게 수정만 하는 것
			if(nf.getNfDeptName().equals(originNdDeptName)) {// 기존의 부서와 동일한 경우 단순하게 수정 
				result = nfDao.updateNotificationCase1(sqlSession, nf);
			}else {// 부서가 달라진 경우 
				//싸그리수정을 해주고 기존의 알림은 싸그리 날릴필요는 없다. (읽음 상태만 싹 바꿔주고) 해당 부서 사원번호로다가 싸그리 insert시키는 개념으로 접근하면 된다. 
				//1. 기존의 부서의 알림은 nf_check쪽에서 읽음 처리하고 
				//2. 새로운 부서쪽에서 새로이 nf_check테이블에 insert하는 방식
				result = nfDao.updateNotificationCase2(sqlSession, nf, originNdDeptName);										
			}
		}else{// 재일림으로 nf_check테이블에서 해당 읽음표시 싸그리 바꿔줘야함.
			if(nf.getNfDeptName().equals(originNdDeptName)) {// 기존의 부서와 일치하는 경우 
				result = nfDao.updateNotificationCase3(sqlSession, nf);
			}else {//부서가 일치 하지 않는경우 단순하게 Notification테이블만 update해주면 된다.
				result = nfDao.updateNotificationCase2(sqlSession, nf, originNdDeptName);										
			}			
		}		
		return result;

	}
	
	//------------------------------※ 사용자단 알림 로직들 -------------------------------------------------------
	/** ajax로 나의 memNo를 기준으로 알림 목록 가져오는 서비스 
	 */
	@Override
	public ArrayList<Notification> ajaxSelectListNf(int memNo) {
		return nfDao.ajaxSelectListNf(sqlSession, memNo) ;
	}

	/** 단순히 읽지 않은 알림 갯수 조회해오는 ajax 서비스
	 */
	@Override
	public int ajaxCountUnreadedNf(int memNo) {
		return nfDao.ajaxCountUnreadedNf(sqlSession, memNo);
	}

	/** 읽지않은 알림 리스트 가져오는 ajax 서비스 
	 */
	@Override
	public ArrayList<Notification> ajaxSelectUnreadedNf(int memNo) {
		return nfDao.ajaxSelectUnreadedNf(sqlSession, memNo);
	}

	/**받은 알림을 읽음 처리하는 서비스
	 */
	@Override
	public int ajaxUpdateUserNf(HashMap<Object, Object> nfNoList) {
		return nfDao.ajaxUpdateUserNf(sqlSession, nfNoList);
	}

}
