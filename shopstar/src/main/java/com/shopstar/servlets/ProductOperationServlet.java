package com.shopstar.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopstar.dao.CategoryDao;
import com.shopstar.entities.Category;
import com.shopstar.helper.FactoryProvide;

public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		PrintWriter out = response.getWriter();
//		fatching category data
		String op= request.getParameter("operation");
		
//		add category
		if(op.trim().equals("addcategory")) {

		String tital = request.getParameter("catTitle");
		String disc = request.getParameter("catDesc");
		Category category = new Category(tital, disc);
		
//		category save in database
		CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
		int catId = categoryDao.saveCategory(category);
		out.println("category added");

		
//		messegae send 
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("message", "Category added successfully : "+catId);
		response.sendRedirect("admin.jsp");
		}
//		add product 
		else if(op.trim().equals("addproduct")) {
			
			
		}



}

}
