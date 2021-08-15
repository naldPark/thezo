package com.kh.thezo.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.reservation.model.vo.Resource;

@Repository
public class ReservationDao {
	public ArrayList<Resource> selectResourceList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList");
	}
}
