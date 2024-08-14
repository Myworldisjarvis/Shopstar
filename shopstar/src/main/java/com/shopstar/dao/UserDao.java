package com.shopstar.dao;

import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.shopstar.entities.User;

public class UserDao {
		private SessionFactory factory;

		public UserDao(SessionFactory factory) {
			super();
			this.factory = factory;
		}
	
	// get user by email and password
		
		public User getUserByEmailAndPassword(String eamil , String password) {
			
			User user=null;
			try {
				String query = "from User where userEmail =:e and userPassword =:p ";
				Session session = this.factory.openSession();
				Query q= session.createQuery(query);
				q.setParameter("e", eamil);
				q.setParameter("p", password);
				user = (User) q.uniqueResult();

				session.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return user;
		}
		
		//user by id 

	    public User getUserById(int userId) throws IllegalStateException, SystemException {
	        User user = null;
	        Transaction tx =null;
	        Session session = null ;
	        try {
	        	session = this.factory.openSession();
				 tx = (Transaction) session.beginTransaction();
	            user = session.get(User.class, userId);
	            tx.commit();
	            session.close();
	        } catch (Exception e) {
	            if (tx != null) tx.rollback();
	            e.printStackTrace();
	        }
	        return user;
	    }
	}
		

