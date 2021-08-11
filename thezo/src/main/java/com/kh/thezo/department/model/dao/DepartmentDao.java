package com.kh.thezo.department.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.department.model.vo.Department;

@Repository
public class DepartmentDao {
	
	public int insertDept(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("departmentMapper.insertDept", d);
	}
	
	public int depNocheck(SqlSessionTemplate sqlSession, String depNo) {
		return sqlSession.selectOne("departmentMapper.depNocheck", depNo);
	}
	
	public int departmentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("departmentMapper.departmentListCount");
	}
	
	public ArrayList<Department> selectDepartment(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("departmentMapper.selectDepartment", null, rowBounds);
	}
	
}
