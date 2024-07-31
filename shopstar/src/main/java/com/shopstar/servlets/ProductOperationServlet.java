package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopstar.entities.Category;

public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
//		fatching category data
		String op= request.getParameter("operation");
		
//		add category
		if(op.trim().equals("addcategory")) {

		String tital = request.getParameter("catTitle");
		String disc = request.getParameter("catDesc");
		Category category = new Category(tital, disc);
		

		}
//		add product 
		else if(op.trim().equals("addproduct")) {
			
			
		}



}

}
