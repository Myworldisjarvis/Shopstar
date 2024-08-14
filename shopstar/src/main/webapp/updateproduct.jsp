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

<%@ page import="com.shopstar.dao.ProductDao"%>
<%@ page import="com.shopstar.entities.Product"%>
<%@ page import="com.shopstar.dao.CategoryDao"%>
<%@ page import="com.shopstar.entities.Category"%>
<%@ page import="com.shopstar.helper.FactoryProvide"%>
<%@ page import="java.util.List"%>

<%
// Fetch the product ID from the request
int productId = Integer.parseInt(request.getParameter("id"));

ProductDao productDao = new ProductDao(FactoryProvide.getFactory());
Product product = productDao.getProductById(productId);

CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
List<Category> categories = categoryDao.getCategory();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(135deg, #1e1e1e, #272727, #303030);
	color: #fff;
	font-family: 'Roboto', sans-serif;
}

.update-product-page .container {
	margin-top: 50px;
}

.update-product-page .form-group label {
	color: #e0e0e0;
}

.update-product-page .form-control {
	background-color: #2c2c2c;
	color: #fff;
	border: 1px solid #444;
}

.update-product-page .form-control:focus {
	background-color: #3c3c3c;
	color: #fff;
	border-color: #555;
	box-shadow: none;
}

.update-product-page .btn-primary {
	background-color: #444;
	border: none;
	transition: background-color 0.2s, box-shadow 0.2s;
}

.update-product-page .btn-primary:hover {
	background-color: #555;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.update-product-page .btn-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.25);
}

.update-product-page .back-btn, .update-product-page .vprod-back-btn {
	margin-bottom: 20px;
	display: block;
	background-color: #444;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.2s, transform 0.2s;
}

.update-product-page .back-btn:hover, .update-product-page .vprod-back-btn:hover {
	background-color: #555;
	transform: scale(1.05);
}

.update-product-page .product-image-preview {
	max-width: 200px;
	max-height: 200px;
	border-radius: 10px;
	border: 1px solid #555;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>



	<div class="container update-product-page mt-5">
	
				<a href="viewAllProducts.jsp" class="vprod-back-btn mt-3">Back to All Products</a>
		<h2 class="text-center">Update Product</h2>
		<form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%=product.getpId()%>">

			<div class="form-group">
				<label for="productName">Product Name</label> 
				<input type="text" class="form-control" id="productName" name="productName" value="<%=product.getpName()%>" required>
			</div>

			<div class="form-group">
				<label for="productDescription">Product Description</label>
				<textarea class="form-control" id="productDescription" name="productDescription" required><%=product.getpDisc()%></textarea>
			</div>

			<div class="form-group">
				<label for="productPrice">Product Price</label> 
				<input type="number" class="form-control" id="productPrice" name="productPrice" value="<%=product.getpPrice()%>" required>
			</div>

			<div class="form-group">
				<label for="productQuantity">Product Quantity</label> 
				<input type="number" class="form-control" id="productQuantity" name="productQuantity" value="<%=product.getpQuantity()%>" required>
			</div>

			<div class="form-group">
				<label for="productDiscount">Product Discount</label> 
				<input type="number" class="form-control" id="productDiscount" name="productDiscount" value="<%=product.getPdiscount()%>" required>
			</div>

			<div class="form-group">
				<label for="productCategory">Choose Product Category</label> 
				<select class="form-control" id="productCategory" name="productCategory" required>
					<%
					Integer selectedCategoryId = null;
					if (product.getCategory() != null) {
						selectedCategoryId = product.getCategory().getCategoryID();
					}

					for (Category category : categories) {
					%>
					<option value="<%=category.getCategoryID()%>" <%=selectedCategoryId != null && category.getCategoryID() == selectedCategoryId ? "selected" : ""%>>
						<%=category.getCategoryTital()%>
					</option>
					<%
					}
					%>
				</select>
			</div>

			<div class="form-group">
				<label>Current Product Image</label><br>
				<img src="img/products/<%=product.getpPhoto()%>" alt="Product Image" class="product-image-preview">
			</div>

			<div class="form-group">
				<label for="productImage">Update Product Image</label> 
				<input type="file" class="form-control-file" id="productImage" name="productImage">
			</div>

			<button type="submit" class="btn btn-primary">Update Product</button>

		</form>
	</div>




<%@include file="components/common_modals.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
