package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shopstar.dao.ProductDao;
import com.shopstar.entities.Product;
import com.shopstar.helper.FactoryProvide;

public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product details from the form
        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        int price = Integer.parseInt(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        int discount = Integer.parseInt(request.getParameter("productDiscount"));

        // Create a Product object and set the values
        Product product = new Product();
        product.setpId(productId);
        product.setpName(name);
        product.setpDisc(description);
        product.setpPrice(price);
        product.setpQuantity(quantity);
        product.setPdiscount(discount);

        // Update the product using ProductDao
        ProductDao productDao = new ProductDao(FactoryProvide.getFactory());
        boolean result = productDao.updateProduct(product);

        if (result) {
            request.getSession().setAttribute("message", "Product updated successfully!");
        } else {
            request.getSession().setAttribute("message", "Failed to update product.");
        }

        // Redirect to the product list page
        response.sendRedirect("viewAllProducts.jsp");
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch product ID from the request
        int productId = Integer.parseInt(request.getParameter("id"));
        
        // Create ProductDao instance
        ProductDao productDao = new ProductDao(FactoryProvide.getFactory());
        
        // Fetch product details from the database
        Product product = productDao.getProductById(productId);
        
        // Set product as request attribute
        request.setAttribute("product", product);
        
        // Forward request to update product JSP
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
    }
    
    
}
