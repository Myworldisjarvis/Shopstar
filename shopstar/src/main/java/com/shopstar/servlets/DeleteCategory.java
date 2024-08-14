package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopstar.dao.CategoryDao;
import com.shopstar.dao.ProductDao;
import com.shopstar.helper.FactoryProvide;

public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCategory() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get action type and category ID from request
        String action = request.getParameter("action");
        int categoryId = Integer.parseInt(request.getParameter("id"));
        
        CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());

        if ("delete".equals(action)) {
            // Handle delete
            boolean result = categoryDao.deleteCategory(categoryId);
            if (result) {
                request.getSession().setAttribute("message", "Category deleted successfully!");
            } else {
                request.getSession().setAttribute("message", "Failed to delete Category.");
            }
        } 

        // Redirect to the product list page
        response.sendRedirect("viewAllCategories.jsp");


	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
