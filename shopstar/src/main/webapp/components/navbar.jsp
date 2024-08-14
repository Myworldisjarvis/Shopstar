<%@page import="java.util.List"%>
<%@page import="com.shopstar.dao.CategoryDao"%>
<%@page import="com.shopstar.entities.Category"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>

<%@page import="com.shopstar.entities.User"%>
<%
    User usertype = (User) session.getAttribute("current_user");

    // Fetch top 10 categories from the database
    CategoryDao catDao = new CategoryDao(FactoryProvide.getFactory());
    List<Category> topCategories = catDao.getCategory();
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Shop-Star</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Categories </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <% for (Category cate : topCategories) { %>
                            <a class="dropdown-item" href="index.jsp?category=<%= cate.getCategoryID() %>"><%= cate.getCategoryTital() %></a>
                        <% } %>
                                            </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="#" data-toggle="modal" data-target="#cart">
                    <i class="fa fa-cart-plus" style="font-size: 16px;"></i><span class="ml-1 cart-items">(0)</span>
                </a></li>

                <% if (usertype == null) { %>
                    <li class="nav-item active"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item active"><a class="nav-link" href="register.jsp">Register</a></li>
                <% } else { %>
                    <li class="nav-item active"><a class="nav-link" href="<%= usertype.getUserType().equals("admin") ? "admin.jsp" : "user.jsp" %>"><%= usertype.getUserName() %></a></li>
                    <li class="nav-item active"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
