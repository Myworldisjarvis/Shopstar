package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopstar.dao.ProductDao;
import com.shopstar.entities.Product;
import com.shopstar.helper.FactoryProvide;

public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get action type and product ID from request
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("id"));
        
        ProductDao productDao = new ProductDao(FactoryProvide.getFactory());

        if ("delete".equals(action)) {
            // Handle delete
            boolean result = productDao.deleteProduct(productId);
            if (result) {
                request.getSession().setAttribute("message", "Product deleted successfully!");
            } else {
                request.getSession().setAttribute("message", "Failed to delete product.");
            }
        } 

        // Redirect to the product list page
        response.sendRedirect("viewAllProducts.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
