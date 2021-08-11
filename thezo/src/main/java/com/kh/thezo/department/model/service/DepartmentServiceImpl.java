package com.kh.thezo.department.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.department.model.dao.DepartmentDao;
import com.kh.thezo.department.model.vo.Department;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//부서등록
	@Override
	public int insertDept(Department d) {
		return dDao.insertDept(sqlSession, d);
	}

	//부서코드 중복조회
	@Override
	public int depNocheck(String depNo) {
		return dDao.depNocheck(sqlSession, depNo);
	}

	@Override
	public int departmentListCount() {
		return dDao.departmentListCount(sqlSession);
	}

	@Override
	public ArrayList<Department> selectDepartment(PageInfo pi) {
		return dDao.selectDepartment(sqlSession, pi);
	}
}
