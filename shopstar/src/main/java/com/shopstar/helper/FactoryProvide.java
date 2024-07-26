package com.shopstar.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvide {

	private static SessionFactory factory;
	
	
	//this is a singelton dessign pattern and also we create session 
	public static SessionFactory getFactory() {
		try {
			if (factory==null) 
			{
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return factory;
	}
}
