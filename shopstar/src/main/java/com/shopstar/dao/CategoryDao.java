package com.shopstar.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.shopstar.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public int saveCategory(Category cat) {
        int catId = 0;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            // Check if the category already exists
            Query<Category> query = session.createQuery("from Category where categoryTital = :title", Category.class);
            query.setParameter("title", cat.getCategoryTital());
            List<Category> existingCategories = query.list();

            if (existingCategories.isEmpty()) {
                catId = (int) session.save(cat);
                tx.commit();
            } else {
                // Category already exists, handle accordingly
//                System.out.println("Category already exists: " + cat.getCategoryTital());
            	return -1;
            }
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return catId;
    }
	
	
	public List<Category> getCategory(){
			Session session = this.factory.openSession();
			Query query = session.createQuery("from Category");
			List<Category> list = query.list();
			session.close();
			return list;
		
	}
	
	public Category getCategoryById(int cid) {
		Category cat=null;
		try {
			
		  Session session = this.factory.openSession();
		  cat = session.get(Category.class, cid);
		  session.close();
		  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cat;
		
	}
	
	
}
