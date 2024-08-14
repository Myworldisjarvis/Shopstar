<%@page import="com.shopstar.dao.CategoryDao"%>
<%@page import="com.shopstar.entities.Category"%>
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

<!-- Product category -->
<!--  gating category from db-->
<%
CategoryDao cdao = new CategoryDao(FactoryProvide.getFactory());
List<Category> categorys = cdao.getCategory();
%>


<%@page import="com.shopstar.dao.ProductDao"%>
<%@page import="com.shopstar.entities.Product"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<%@page import="java.util.List"%>

<%
ProductDao pdao = new ProductDao(FactoryProvide.getFactory());
List<Product> products = pdao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="components/common_css_js.jsp"%>
<title>View All Products</title>
<style>
/* this is my update model css start  */
body {
	background: linear-gradient(135deg, #1e1e1e, #272727, #303030);
	color: #fff;
	font-family: 'Roboto', sans-serif;
}

/*  .container {
            margin-top: 80px;
        } */
.card {
	background-color: rgba(44, 44, 44, 0.9);
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s;
	background-image: linear-gradient(to right, #3c3c3c, #444);
}

.card:hover {
	transform: translateY(-10px);
}

.card-header {
	background-color: rgba(60, 60, 60, 0.9);
	border-bottom: none;
	border-radius: 15px 15px 0 0;
}

.form-control {
	background-color: #2c2c2c;
	color: #fff;
	border: 1px solid #444;
}

.form-control:focus {
	background-color: #3c3c3c;
	color: #fff;
	border-color: #555;
	box-shadow: none;
}

.btn-primary {
	background-color: #444;
	border: none;
	transition: background-color 0.2s, box-shadow 0.2s;
}

.btn-primary:hover {
	background-color: #555;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.btn-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.25);
}

.icon {
	font-size: 2rem;
	margin-bottom: 10px;
}

.counter {
	font-size: 3rem;
	font-weight: 500;
}

.footer {
	background-color: #1c1c1c;
	color: #ffffff;
}

.footer a {
	color: #ffffff;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}

.footer h5 {
	margin-bottom: 15px;
	font-size: 1.25rem;
	font-weight: 500;
}

.footer p {
	font-size: 0.875rem;
}

/* Modal Styles */
.modal-content {
	background-color: #2c2c2c;
	color: #fff;
}

.modal-header {
	border-bottom: 1px solid #444;
}

.modal-footer {
	border-top: 1px solid #444;
}

/* this is my update model css end */

/* Prefixing all classes with vprod- to avoid conflicts */
body.vprod-body {
	background-color: #1e1e1e;
	font-family: 'Roboto', sans-serif;
	color: #fff;
}

.vprod-container {
	margin-top: 50px;
}

.vprod-heading {
	color: #e0e0e0;
	text-align: center;
	margin-bottom: 20px;
}

.vprod-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #2c2c2c;
	border-radius: 8px;
	overflow: hidden;
}

.vprod-thead {
	background-color: #444;
}

.vprod-thead th {
	color: #fff;
	padding: 15px;
	text-align: left;
}

.vprod-tbody tr {
	border-bottom: 1px solid #444;
}

.vprod-tbody tr:nth-child(even) {
	background-color: #3c3c3c;
}

.vprod-tbody tr:hover {
	background-color: #555;
}

.vprod-tbody td {
	color: #e0e0e0;
	padding: 15px;
}

.vprod-btn {
	padding: 8px 12px;
	border: none;
	border-radius: 5px;
	transition: background-color 0.2s, transform 0.2s;
	font-weight: 500;
	text-transform: uppercase;
	text-align: center;
	display: inline-block;
	min-width: 100px;
}

.vprod-btn-warning {
	background-color: #ffa726;
	color: #000;
}

.vprod-btn-warning:hover {
	background-color: #ff9800;
	transform: scale(1.05);
}

.vprod-btn-danger {
	background-color: #ef5350;
	color: #fff;
}

.vprod-btn-danger:hover {
	background-color: #e53935;
	transform: scale(1.05);
}

.vprod-action-buttons {
	display: flex;
	gap: 10px;
}

.vprod-back-btn {
	margin-bottom: 20px;
	display: block;
	background-color: #444;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.2s, transform 0.2s;
}

.vprod-back-btn:hover {
	background-color: #555;
	transform: scale(1.05);
}

.vprod-text-center {
	text-align: center;
}

.vprod-image {
	width: 80px;
	height: auto;
	border-radius: 5px;
}
</style>
</head>
<body class="vprod-body">
	<%@include file="components/navbar.jsp"%>
	<div class="container">

		<div class="vprod-container">
			<a href="admin.jsp" class="vprod-back-btn">Back to Admin Panel</a>
			<h2 class="vprod-heading">All Products</h2>
			<table class="vprod-table">
				<thead class="vprod-thead">
					<tr>
						<th>#</th>
						<th>Product Image</th>
						<th>Product Name</th>
						<th>Category</th>
						<th>Description</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Discount</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody class="vprod-tbody">
					<%
					for (Product product : products) {
						Category category = cdao.getCategoryById(product.getCategory().getCategoryID());
					%>
					<tr>
						<td>SHTECH<%=product.getpId()%></td>
						<td><img src="img/products/<%=product.getpPhoto()%>"
							alt="<%=product.getpName()%>" class="vprod-image"></td>
						<td><%=product.getpName()%></td>
						<td><%=category.getCategoryTital()%></td>
						<td><%=product.getpDisc()%></td>
						<td>&#8377;<%=product.getpPrice()%></td>
						<td><%=product.getpQuantity()%></td>
						<td><%=product.getPdiscount()%>%</td>
						<td>
							<div class="vprod-action-buttons">
								<a href="UpdateProductServlet?id=<%=product.getpId()%>"
									class="vprod-btn vprod-btn-warning">Update</a> <a
									href="deleteAndUpdateProductServlet?action=delete&id=<%=product.getpId()%>"
									class="vprod-btn vprod-btn-danger">Delete</a>
							</div>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
