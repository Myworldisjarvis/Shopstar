package com.shopstar.servlets;

import com.shopstar.dao.ProductDao;
import com.shopstar.dao.CategoryDao;
import com.shopstar.entities.Product;
import com.shopstar.entities.Category;
import com.shopstar.helper.FactoryProvide;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch product ID
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Fetch other parameters
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        String priceStr = request.getParameter("productPrice");
        String quantityStr = request.getParameter("productQuantity");
        String discountStr = request.getParameter("productDiscount");
        String categoryStr = request.getParameter("productCategory");

        if (name == null || description == null || priceStr == null || quantityStr == null || discountStr == null || categoryStr == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        int price;
        int quantity;
        int discount;
        int categoryId;

        try {
            price = Integer.parseInt(priceStr);
            quantity = Integer.parseInt(quantityStr);
            discount = Integer.parseInt(discountStr);
            categoryId = Integer.parseInt(categoryStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        ProductDao productDao = new ProductDao(FactoryProvide.getFactory());
        Product product = productDao.getProductById(productId);

        if (product == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Handle product image upload
        Part filePart = request.getPart("productImage");
        String imageName = null;
        if (filePart != null && filePart.getSize() > 0) {
            // Get the file name
            String fileName = filePart.getSubmittedFileName();
            
            // Save the image and get its name
            imageName = saveImage(filePart.getInputStream(), fileName);
        } else {
            // Keep the existing image name if no new image is uploaded
            imageName = product.getpPhoto();
        }

        CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
        Category category = categoryDao.getCategoryById(categoryId);

        if (category == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Update the product
        product.setpName(name);
        product.setpDisc(description);
        product.setpPrice(price);
        product.setpQuantity(quantity);
        product.setPdiscount(discount);
        product.setCategory(category);
        product.setpPhoto(imageName);

        boolean result = productDao.updateProduct(product);

        if (result) {
            response.sendRedirect("viewAllProducts.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private String saveImage(InputStream inputStream, String fileName) throws IOException {
        // Define the path to save the image
        String imagePath = getServletContext().getRealPath("") + File.separator + "img" + File.separator + "products" + File.separator + fileName;
        
        // Create the directory if it does not exist
        File imageFile = new File(imagePath);
        imageFile.getParentFile().mkdirs();
        
        // Save the image file
        try (FileOutputStream outputStream = new FileOutputStream(imageFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        
        return fileName;  // Return the file name to store in the database
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
