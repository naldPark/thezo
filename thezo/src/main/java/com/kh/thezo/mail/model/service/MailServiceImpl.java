package com.kh.thezo.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.thezo.approval.model.dao.ApprovalDao;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.dao.MailDao;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;

@Service
public class MailServiceImpl implements MailService {
	
	
	@Autowired
	private MailDao mmDao;
	@Autowired
	private ApprovalDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	// 메인페이지 안읽은 메일 갯수 조회
	@Override
	public int mainMailCount(int memNo) {
		return mmDao.mainMailCount(memNo, sqlSession);
	}
	
	@Override
	public int selectMailListCount(Mail mm) {
		return mmDao.selectMailListCount(mm, sqlSession);
	}

	@Override
	public ArrayList<Mail> selectMailList(Mail mm, PageInfo pi) {
		return mmDao.selectMailList(mm, pi, sqlSession);
	}
	
	@Override
	public int selectSpamMailListCount(Mail mm) {
		return mmDao.selectSpamMailListCount(mm, sqlSession);
	}

	@Override
	public ArrayList<Mail> selectSpamMailList(Mail mm, PageInfo pi) {
		return mmDao.selectSpamMailList(mm, pi, sqlSession);
	}
	
	@Override
	public int selectSendListCount(int memNo) {
		return mmDao.selectSendListCount(memNo, sqlSession);
	}

	@Override
	public ArrayList<Mail> selectSendList(int memNo, PageInfo pi) {
		return mmDao.selectSendList(memNo, pi, sqlSession);
	}
	
	@Override
	public ArrayList<Member> employeeList() {
		return aDao.employeeList(sqlSession);
	}
	
	@Override
	public int insertPopList(ArrayList<Mail> mList) {
		
		int result=0;
		for (int i = 0; i < mList.size(); i++) {
			mmDao.insertPopList(sqlSession, mList.get(i));
			if(mList.get(i).getAt()!=null) {
			mmDao.insertMailAttachment(sqlSession, mList.get(i));
			}
		}
		return result;
	}
	
	@Override
	public int sendMail(Mail mm) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
        TransactionStatus status = transactionManager.getTransaction(def);
        int result=1;
		result= result*mmDao.sendMail(sqlSession, mm);
		
		if(mm.getAt()!=null) {
			result= result*mmDao.insertMailAttachment(sqlSession, mm);
		}
		
		if(result>0) {
			transactionManager.commit(status);
		} else{
			transactionManager.rollback(status);
		}
		return result;
	}
	
	@Override
	public Mail selectDetailMail(int mno) {
		return mmDao.selectDetailMail(sqlSession, mno);
	}
	
	@Override
	public ArrayList<Attachment> selectDetailMailAt(Mail mm){
		return mmDao.selectDetailMailAt(sqlSession, mm);
	}
	
	@Override
	public int updateReadMailOne(int mno) {
		return mmDao.updateReadMailOne(sqlSession, mno);
	}
	
	@Override
	public int updateReadMail(ArrayList<String> reMailNoAry) {
		return mmDao.updateReadMail(sqlSession, reMailNoAry);
	}
	
	@Override
	public int updateSpamMail(ArrayList<String> reMailNoAry) {
		return mmDao.updateSpamMail(sqlSession, reMailNoAry);
	}
	
	@Override
	public int updateUnSpamMail(ArrayList<String> reMailNoAry) {
		return mmDao.updateUnSpamMail(sqlSession, reMailNoAry);
	}
	
	
	@Override
	public int updateDeleteMail(ArrayList<String> reMailNoAry) {
		return mmDao.updateDeleteMail(sqlSession, reMailNoAry);
	}
	
	@Override
	public int updateDeleteSendMail(ArrayList<String> seMailNoAry) {
		return mmDao.updateDeleteSendMail(sqlSession, seMailNoAry);
	}
	
	@Override
	public Mail selectSendDetailMail(int mno) {
		return mmDao.selectSendDetailMail(sqlSession, mno);
	}
	
}
