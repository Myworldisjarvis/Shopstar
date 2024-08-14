<%@page import="com.shopstar.entities.User"%>
<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not Admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page import="com.shopstar.dao.CategoryDao"%>
<%@ page import="com.shopstar.entities.Category"%>
<%@ page import="com.shopstar.helper.FactoryProvide"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<%
// Fetch the category ID from the request
int categoryId = Integer.parseInt(request.getParameter("id"));

CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
Category category = categoryDao.getCategoryById(categoryId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Category</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(135deg, #1e1e1e, #272727, #303030);
	color: #fff;
	font-family: 'Roboto', sans-serif;
}

.update-category-page .container {
	margin-top: 50px;
}

.update-category-page .form-group label {
	color: #e0e0e0;
}

.update-category-page .form-control {
	background-color: #2c2c2c;
	color: #fff;
	border: 1px solid #444;
}

.update-category-page .form-control:focus {
	background-color: #3c3c3c;
	color: #fff;
	border-color: #555;
	box-shadow: none;
}

.update-category-page .btn-primary {
	background-color: #444;
	border: none;
	transition: background-color 0.2s, box-shadow 0.2s;
}

.update-category-page .btn-primary:hover {
	background-color: #555;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.update-category-page .btn-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.25);
}

.update-category-page .back-btn {
	margin-bottom: 20px;
	display: block;
	background-color: #444;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.2s, transform 0.2s;
}

.update-category-page .back-btn:hover {
	background-color: #555;
	transform: scale(1.05);
}

.update-category-page .vprod-back-btn {
	margin-bottom: 20px;
	display: block;
	background-color: #444;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.2s, transform 0.2s;
}

.update-category-page .vprod-back-btn:hover {
	background-color: #555;
	transform: scale(1.05);
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	
	
	<div class="container update-category-page mt-5">
	<a href="viewAllCategories.jsp" class="vprod-back-btn mt-3">Back to All Categorys</a>
		<h2 class="text-center">Update Category</h2>
		<form action="UpdateCategory" method="post">
			<input type="hidden" name="id"
				value="<%=((Category) request.getAttribute("category")).getCategoryID()%>">
			<div class="form-group">
				<label for="categoryName">Category Name</label> <input type="text"
					class="form-control" id="categoryName" name="categoryName"
					value="<%=((Category) request.getAttribute("category")).getCategoryTital()%>"
					required>
			</div>
			<div class="form-group">
				<label for="categoryDescription">Category Description</label>
				<textarea class="form-control" id="categoryDescription"
					name="categoryDescription" required><%=((Category) request.getAttribute("category")).getCategoryDescription()%></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Update
				Category</button>
			
		</form>
	</div>

	<%@include file="components/common_modals.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
