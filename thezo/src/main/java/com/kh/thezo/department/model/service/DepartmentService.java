package com.kh.thezo.department.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.department.model.vo.Department;

public interface DepartmentService {
	
	// 부서등록 서비스
	int insertDept(Department d);
	
	// 부서 코드 중복 조회
	int depNocheck(String depNo);
	
	//부서 조회용
	int departmentListCount();
	ArrayList<Department> selectDepartment(PageInfo pi);

}
