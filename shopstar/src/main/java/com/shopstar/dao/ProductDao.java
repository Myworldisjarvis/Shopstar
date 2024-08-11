package com.shopstar.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.shopstar.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public boolean saveProduct(Product product) {
		boolean f = false;
		try {
			
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(product);
			
			tx.commit();
			session.close();
			
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		
		return f;
	}
	
//	get all products
	public List<Product> getAllProducts(){
		
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}
	// Add this method in ProductDao
	public Product getProductById(int productId) {
	    Session session = this.factory.openSession();
	    Product product = session.get(Product.class, productId);
	    session.close();
	    return product;
	}
	
	
//	get all products of given category
	public List<Product> getAllProductsById(int cid){
		
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.categoryID =: id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
	
	
	//update product
	public boolean updateProduct(Product product) {
	    boolean f = false;
	    try {
	        Session session = this.factory.openSession();
	        Transaction tx = session.beginTransaction();
	        
	        session.update(product);
	        
	        tx.commit();
	        session.close();
	        
	        f = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        f = false;
	    }
	    return f;
	}
	
	//delete product
	public boolean deleteProduct(int productId) {
	    boolean f = false;
	    try {
	        Session session = this.factory.openSession();
	        Transaction tx = session.beginTransaction();
	        
	        Product product = session.get(Product.class, productId);
	        if (product != null) {
	            session.delete(product);
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
