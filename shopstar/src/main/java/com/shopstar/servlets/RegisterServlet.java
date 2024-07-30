package com.shopstar.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shopstar.entities.User;
import com.shopstar.helper.FactoryProvide;

//this is for annotation based mapping but ( i maped in web.xml)
//@WebServlet(name="RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		PrintWriter out = response.getWriter();
		
		try {
			
			
			String user_Name = request.getParameter("name");
			String user_Email = request.getParameter("email");
			String user_Password = request.getParameter("password");
			String user_Number = request.getParameter("phonenumber");
			String user_Address = request.getParameter("address");
			
			//creating user object to store data 
			User user = new User(user_Name, user_Email, user_Password,user_Number,"default.jpg", user_Address, "normal");
			
			Session hibernateSession = FactoryProvide.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			
			int userId = (int)hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			

//			validation	
			if(user_Name.isEmpty()) {
				out.println("Name is blank");
				return;
			}
			
			
			HttpSession session = request.getSession();
			session.setAttribute("message", "Register successfully !! User ID is : "+userId);
			response.sendRedirect("register.jsp");
			return;
			 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
	}

}
