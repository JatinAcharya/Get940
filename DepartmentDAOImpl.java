package com.dept;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

public class DepartmentDAOImpl {
	ArrayList<Department> deptList = new ArrayList<Department>();
	SessionFactory factory;
	
	DepartmentDAOImpl() {
		
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		System.out.println("=>Service Registry..."+serviceRegistry);
		
		Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
		System.out.println("=>Meta Data..."+metadata);
		
		factory = metadata.getSessionFactoryBuilder().build();
		System.out.println("=>Session Factory..."+factory);
		
	}
	
	public void insertDepartment(Department dept) {
		Session session = factory.getCurrentSession();
		System.out.println("=>Session..."+session);
		Transaction tx = session.beginTransaction();
		session.save(dept);
		tx.commit();
	}

	public Department selectDepartment(int deptno) {
		Session session = factory.getCurrentSession();
		System.out.println("=>Session..."+session);
		Transaction tx = session.beginTransaction();
		return session.get(Department.class, deptno);
	}

	public List<Department> selectAllDepartments() {
		Session session = factory.getCurrentSession();
		System.out.println("=>Session..."+session);
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Department");//HQL hibernate query language we pass the pojo here
		List<Department> deptList = query.getResultList();
		tx.commit();
		return deptList;
	}

	public void updateDepartment(Department dept) {
		Session session = factory.getCurrentSession();
		System.out.println("=>Session..."+session);
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(dept); //sql update query
		tx.commit();
		//session.saveOrUpdate()
	}

	public void deleteDepartment(Department dept) {
		Session session = factory.getCurrentSession();
		System.out.println("=>Session..."+session);		
		Transaction tx = session.beginTransaction();		
		session.remove(dept);
		tx.commit();
	}
}
