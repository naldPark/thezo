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
	
	
	@Override
	public int selectReceiveCount(Member m) {
		return mmDao.selectReceiveCount(m, sqlSession);
	}

	@Override
	public ArrayList<Mail> selectReceive(Member m, PageInfo pi) {
		return mmDao.selectReceive(m, pi, sqlSession);
	}
	
	@Override
	public ArrayList<Member> employeeList() {
		return aDao.employeeList(sqlSession);
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
	
}
