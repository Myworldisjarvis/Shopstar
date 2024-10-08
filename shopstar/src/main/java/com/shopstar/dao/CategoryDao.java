package com.shopstar.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.shopstar.entities.Category;
import com.shopstar.entities.Product;

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
	
	
	//update category
		public boolean updateCategory(Category category) {
		    boolean f = false;
		    try {
		        Session session = this.factory.openSession();
		        Transaction tx = session.beginTransaction();
		        
		        session.update(category);
		        
		        tx.commit();
		        session.close();
		        
		        f = true;
		    } catch (Exception e) {
		        e.printStackTrace();
		        f = false;
		    }
		    return f;
		}
		
		//delete Category
		public boolean deleteCategory(int categoryId) {
		    boolean f = false;
		    try {
		        Session session = this.factory.openSession();
		        Transaction tx = session.beginTransaction();
		        
		        Category category = session.get(Category.class, categoryId);
		        if (category != null) {
		            session.delete(category);
		            f = true;
		        }
		        
		        tx.commit();
		        session.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		        f = false;
		    }
		    return f;
		}

		
	
}
