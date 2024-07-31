package com.shopstar.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shopstar.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public int saveCategory(Category cat) {
		int catId=0;
		try {
			
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			catId = (int) session.save(cat);
			tx.commit();
			session.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return catId;
	}
	
	
	
	
	
}
