package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shopstar.dao.CategoryDao;
import com.shopstar.dao.ProductDao;
import com.shopstar.entities.Category;
import com.shopstar.entities.Product;
import com.shopstar.helper.FactoryProvide;

public class UpdateCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCategory() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch category details from the request
        int categoryId = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        String categoryDescription = request.getParameter("categoryDescription");

        // Create Category object
        Category category = new Category();
        category.setCategoryID(categoryId);
        category.setCategoryTital(categoryName);
        category.setCategoryDescription(categoryDescription);

        // Update category using CategoryDao
        CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
        boolean isUpdated = categoryDao.updateCategory(category);

        // Redirect based on update success
        if (isUpdated) {
            response.sendRedirect("viewAllCategories.jsp"); // Redirect to a page showing all categories
        } else {
            request.setAttribute("message", "Category update failed!");
            request.getRequestDispatcher("updateCategory.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch product ID from the request
        int categoryId = Integer.parseInt(request.getParameter("id"));
        
        // Create ProductDao instance
        CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
        
        // Fetch product details from the database
        Category category =categoryDao.getCategoryById(categoryId);
        
        // Set product as request attribute
        request.setAttribute("category", category);
        
        // Forward request to update product JSP
        request.getRequestDispatcher("updatecategory.jsp").forward(request, response);
    }
}
