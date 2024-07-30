package com.shopstar.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopstar.dao.UserDao;
import com.shopstar.entities.User;
import com.shopstar.helper.FactoryProvide;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		public LoginServlet(){
       
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		try {
			PrintWriter out = response.getWriter();
			
			String email = request.getParameter("email");
			String password= request.getParameter("password");
			
				
			//authitacate
			UserDao userDao = new UserDao(FactoryProvide.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			
			
			
			HttpSession session = request.getSession();
			
			if(user==null) {
				session.setAttribute("message", "Invalid Details !! Try with another one");
				response.sendRedirect("login.jsp");
				return;
				
			}else {
				out.println("<h1>Welcome "+user.getUserName()+"</h1>");
			}
			
			
			
		} catch (Exception e) {
		e.printStackTrace();
		
		}
		
		
		
	}

}
