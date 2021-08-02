package com.dept;

import java.util.List;

import org.junit.jupiter.api.Test;

public class DepartmentTest {

	DepartmentDAOImpl dao = new DepartmentDAOImpl();
	
	@Test
	public void showAllDepts() {
		List<Department> allDepts = dao.selectAllDepartments();
		for(Department d : allDepts) {
			System.out.println("DEPTNO : "+d.getDepartmentNumber());
			System.out.println("DepartmentName : "+d.getDepartmentName());
			System.out.println("DepartmentLocation : "+d.getDepartmentLocation());
       }
	}
	
	@Test
	public void showSingleDeptTest() {
		//ArrayList<Department> allDepts = dao.selectAllDepartments();
        Department dept = dao.selectDepartment(10);
        System.out.println("DEPTNO : "+dept.getDepartmentNumber());
		System.out.println("DepartmentName : "+dept.getDepartmentName());
		System.out.println("DepartmentLocation : "+dept.getDepartmentLocation());
	}
	
	@Test
	public void insertSingleDeptTest() {
		//ArrayList<Department> allDepts = dao.selectAllDepartments();
        Department dept = new Department(50,"QUALITY","DELHI");
        dao.insertDepartment(dept);
        //System.out.println("dept is "+dept);
        List<Department> allDepts = dao.selectAllDepartments();
        for(Department d : allDepts) {
			System.out.println("DEPTNO : "+d.getDepartmentNumber());
			System.out.println("DepartmentName : "+d.getDepartmentName());
			System.out.println("DepartmentLocation : "+d.getDepartmentLocation());
       }
	}
	
	@Test
	public void updateDeptTest() {
		//ArrayList<Department> allDepts = dao.selectAllDepartments();
        Department dept = new Department(10,"INFO","NEW YORK");
        dao.updateDepartment(dept);
        //System.out.println("dept is "+dept);
        List<Department> allDepts = dao.selectAllDepartments();
        for(Department d : allDepts) {
			System.out.println("DEPTNO : "+d.getDepartmentNumber());
			System.out.println("DepartmentName : "+d.getDepartmentName());
			System.out.println("DepartmentLocation : "+d.getDepartmentLocation());
       }
	}
	
	@Test
	public void deleteDeptTest() {
		//ArrayList<Department> allDepts = dao.selectAllDepartments();
        Department dept = new Department(50,"Test","NW");
        dao.deleteDepartment(dept);
        //System.out.println("dept is "+dept);
        List<Department> allDepts = dao.selectAllDepartments();
        for(Department d : allDepts) {
			System.out.println("DEPTNO : "+d.getDepartmentNumber());
			System.out.println("DepartmentName : "+d.getDepartmentName());
			System.out.println("DepartmentLocation : "+d.getDepartmentLocation());
       }
	}
	
		// TODO Auto-generated method stub
//		Department dept1 = new Department();
//		dept1.setDepartmentNumber(50);
//		dept1.setDepartmentName("QMS");
//		dept1.setDepartmentLocation("Mumbai");
//
//		System.out.println("deptno: "+ dept1.getDepartmentNumber());
//		System.out.println("deptno: "+ dept1.getDepartmentName());
//		System.out.println("deptno: "+ dept1.getDepartmentLocation());
		
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
//		System.out.println("=>Service Registry..."+serviceRegistry);
//		
//		Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
//		System.out.println("=>Meta Data..."+metadata);
//		
//		SessionFactory factory = metadata.getSessionFactoryBuilder().build();
//		System.out.println("=>Session Factory..."+factory);
//		
//		Session session = factory.getCurrentSession();
//		System.out.println("=>Session..."+session);
//		
//		Transaction tx = session.beginTransaction();
//		System.out.println("=>Transaction..."+tx);
		
//		INSERT
//		session.save(dept1); //insert query is fired
		
		//SELECT
//		Department dept2 = session.get(Department.class, 30);
//		System.out.println("deptno: "+ dept2.getDepartmentNumber());
//		System.out.println("deptno: "+ dept2.getDepartmentName());
//		System.out.println("deptno: "+ dept2.getDepartmentLocation());
		
//		DELETE
//		Department dept3 = session.get(Department.class, 60);
//		session.delete(dept3);
		
		// 2nd WAY TO DELETE
//		Department temp = new Department();
//		temp.setDepartmentNumber(50);
//		session.delete(temp);
		
		
//		Department dept2 = session.get(Department.class, 30);
//		System.out.println("deptno: "+ dept2.getDepartmentNumber());
//		System.out.println("deptno: "+ dept2.getDepartmentName());
//		System.out.println("deptno: "+ dept2.getDepartmentLocation());
		
		//UPDATE(We cannot update the primary key)
//		Department temp = session.find(Department.class, 50);
//		System.out.println("deptno: "+ temp.getDepartmentNumber());
//		System.out.println("deptno: "+ temp.getDepartmentName());
//		System.out.println("deptno: "+ temp.getDepartmentLocation());
//		System.out.println(">>Call the setter methods");
//		temp.setDepartmentName("QUALITY");
//		temp.setDepartmentLocation("DELHI");
//		session.update(temp);
		
		//SAVE OR UPDATE
//		Department dept3 = new Department();
//		dept3.setDepartmentNumber(60);
//		dept3.setDepartmentName("TEST");
//		dept3.setDepartmentLocation("BANGALORE");
//		//IF NOT FOUND IT LL INSERT, IF FOUND IT WILL UPDATE
//		session.saveOrUpdate(dept3);
		
		//SELECT ALL THE RECORD FROM THE TABLE				 //select * from dept;
//		Query query = session.createQuery("from Department");//HQL hibernate query language we pass the pojo here
//		List<Department> deptList = query.getResultList();
//		Iterator<Department> deptIter = deptList.iterator();
//		while(deptIter.hasNext()) {
//			Department dept = deptIter.next();
//			System.out.println("deptno: "+ dept.getDepartmentNumber());
//			System.out.println("dept Name: "+ dept.getDepartmentName());
//			System.out.println("dept Location: "+ dept.getDepartmentLocation());
//		}
		
//		tx.commit();
//		System.out.println("=>Transaction Committed..."+tx);
//		
//		System.out.println("Closing Session factory...");
//		factory.close();
//		System.out.println("Session factory is closed");

}
