package com.dept;

import java.util.List;

public interface DepartmentDAO {
	void insertDepartment(Department dept);
	Department selectDepartment(int deptno);
	List<Department> selectAllDepartments();
	void updateDepartment(Department dept);
	void deleteDepartment(Department dept);
}
