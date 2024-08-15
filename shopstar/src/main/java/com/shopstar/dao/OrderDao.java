package com.shopstar.dao;


import com.shopstar.entities.Orders;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class OrderDao {
	private SessionFactory factory;

	public OrderDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
    public boolean saveOrder(Orders order) {
    	Transaction tx = null;
        Session session = null;
        try  {
        	session = this.factory.openSession();
            // Start a transaction
        	tx = session.beginTransaction();
            
            // Save the order object
            session.save(order);
            
            // Commit the transaction
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
            	tx.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
}
