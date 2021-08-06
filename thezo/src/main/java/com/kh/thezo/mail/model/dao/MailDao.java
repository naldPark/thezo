package com.kh.thezo.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;

@Repository
public class MailDao {
	
	public int selectReceiveCount(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectReceiveCount",m);
	}
	
	public ArrayList<Mail> selectReceive(Member m, PageInfo pi, SqlSessionTemplate sqlSession) {
		System.out.println(m.getMemNo());
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceive",m);
	}
	
	public int sendMail(SqlSessionTemplate sqlSession, Mail mm) {
		
		return sqlSession.insert("mailMapper.sendMail",mm);
	}
	

	public int insertMailAttachment(SqlSessionTemplate sqlSession, Mail mm) {
		System.out.println(mm.getAt());
		return sqlSession.insert("mailMapper.insertMailAttachment",mm);
	}

}




