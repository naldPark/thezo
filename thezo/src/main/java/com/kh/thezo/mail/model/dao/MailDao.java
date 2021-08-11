package com.kh.thezo.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;

@Repository
public class MailDao {
	
	public int mainMailCount(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.mainMailCount", memNo);
	}
	
	public int selectMailListCount(Mail mm, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectMailListCount", mm);
	}

	public ArrayList<Mail> selectMailList(Mail mm, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("mailMapper.selectMailList", mm, rowBounds);
	}
	
	public int selectSpamMailListCount(Mail mm, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectSpamMailListCount", mm);
	}

	public ArrayList<Mail> selectSpamMailList(Mail mm, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("mailMapper.selectSpamMailList", mm, rowBounds);
	}
	
	
	public int selectSendListCount(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectSendListCount", memNo);
	}

	public ArrayList<Mail> selectSendList(int memNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("mailMapper.selectSendList", memNo, rowBounds);
	}

	// 서버에 있는 받은 메일함 db로 옮기기
	public int insertPopList(SqlSessionTemplate sqlSession, Mail mm) {
		return sqlSession.insert("mailMapper.insertPop", mm);
	}

	public int sendMail(SqlSessionTemplate sqlSession, Mail mm) {

		return sqlSession.insert("mailMapper.sendMail", mm);
	}

	public int insertMailAttachment(SqlSessionTemplate sqlSession, Mail mm) {
		return sqlSession.insert("mailMapper.insertMailAttachment", mm);
	}

	public Mail selectDetailMail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("mailMapper.selectDetailMail", mno);
	}
	
	public ArrayList<Attachment> selectDetailMailAt(SqlSessionTemplate sqlSession,Mail mm) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectDetailMailAt", mm);
	}

	public int updateReadMailOne(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("mailMapper.updateReadMailOne", mno);
	}

	public int updateReadMail(SqlSessionTemplate sqlSession, ArrayList<String> reMailNoAry) {
		return sqlSession.update("mailMapper.updateReadMail", reMailNoAry);
	}

	public int updateSpamMail(SqlSessionTemplate sqlSession, ArrayList<String> reMailNoAry) {
		return sqlSession.update("mailMapper.updateSpamMail", reMailNoAry);
	}
	
	public int updateUnSpamMail(SqlSessionTemplate sqlSession, ArrayList<String> reMailNoAry) {
		return sqlSession.update("mailMapper.updateUnSpamMail", reMailNoAry);
	}

	public int updateDeleteMail(SqlSessionTemplate sqlSession, ArrayList<String> reMailNoAry) {
		return sqlSession.update("mailMapper.updateDeleteMail", reMailNoAry);
	}
	
	public int updateDeleteSendMail(SqlSessionTemplate sqlSession, ArrayList<String> seMailNoAry) {
		return sqlSession.update("mailMapper.updateDeleteSendMail", seMailNoAry);
	}
	
	public Mail selectSendDetailMail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("mailMapper.selectSendDetailMail", mno);
	}

}




