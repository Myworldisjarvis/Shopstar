package com.shopstar.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.shopstar.dao.OrderDao;
import com.shopstar.entities.Orders;
import com.shopstar.entities.User;
import com.shopstar.helper.FactoryProvide;


public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");

        // Check if the user is logged in
        if (user == null) {
            session.setAttribute("message", "You are not logged in! Please log in first.");
            response.sendRedirect("login.jsp");
            return;
        }

        // Get cart data from localStorage (in real implementation, this would be from the request or session)
        String cart = request.getParameter("cart"); // assuming cart data is passed as a parameter
        if (cart == null || cart.isEmpty()) {
            session.setAttribute("message", "Your cart is empty! Please add some products.");
            response.sendRedirect("checkout.jsp");
            return;
        }

        // Process the order here (save order details to the database, etc.)
        
            
            // Assuming totalAmount is calculated somehow
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            String shippingAddress = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipCode = request.getParameter("zip");

            // Create order object
            Orders order = new Orders();
            order.setUser(user);
            order.setTotal_amount(totalAmount);
            order.setStatus("Processing");
            order.setShipping_address(shippingAddress);
            order.setCity(city);
            order.setState(state);
            order.setZip_code(zipCode);

            
            
            
            OrderDao orderDAO = new OrderDao(FactoryProvide.getFactory());
            boolean isSaved = orderDAO.saveOrder(order);

            if (isSaved) {
                response.sendRedirect("orderConfirmation.jsp");
            } else {
                response.sendRedirect("checkout.jsp?error=OrderFailed");
            }

        }
        
        
        
        
    }

