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
		// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ 해야할것!
		// 일단  !!! 만약에 ! checkbox가 선택되어있다면 ? 을 가정해줘야하고 
		// 또한 ! 만약 기존의 부서와 달라졌을때의 로직이 달라진다 !! 
		// 이를 생각하고 post로 값이 넘어갈떄 vo만으로는 받아 내기 비효율 적인것을 생각해서 넘기게 해주자! 
		// 또한 update날짜도 넣어줘야한다. sysdate들어갈수있게! 
		System.out.println(nf);
		System.out.println(originNdDeptName);
		System.out.println(reNotify);
		
		// 이거 3개 가지고 만들어주면된다! 
		
		return 0;
	}

}
